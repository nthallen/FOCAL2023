# Adafruit Ultimate GPS Featherwing Driver

The GPS assembly consists of an Arduino Feather M4 CAN Express
together with an Adafruit Ultimate GPS Featherwing. The Feather
is used as a TTL serial to USB serial converter, passing through
the GPS sentences and commands. This is necessary, as the
Featherwing alone is incapable of driving even an FTDI USB-RS232-3.3.
I assumed the direct connection to the Feather would have the best
chance, and it seems to work fine at 9600 baud, but that appears to
be the limit. Clearly a stronger GPS unit would be advantageous.

The device supports 6 [NMEA sentences][NMEA]:
  - GLL: Geographic position, latitude / longitude
  - RMC: Recommended minimum specific GPS/Transit data
  - VTG: Track made good and ground speed
  - GGA: Global Positioning System Fix Data
  - GSA: GPS DOP and active satellites
  - GSV: GPS Satellites in view
These are listed here in the order they are referenced in the
[PMTK314 configuration command packet][PMTK].

Sentences are of the form:

  $Gxxxx,data,,,*37

where the number after the asterisk is the 2-digit hexadecimal
checksum of the characters between the initial '$' and the
asterisk ('*'). The checksum is just a bitwise XOR of the
character codes.

Since the main goal of adding this GPS to the FOCAL instrument is
to record high rate position and velocity data for use in correcting
the anemometer data for flux measurments, much of the supporting
data here is unnecessary. RMC has most of the data we care about.
GLL is entirely redundant with RMC, as is VTG. GGA adds Altitude,
and GSA adds mode information (whether we have a 2D or 3D solution)
and Dilution of Precision data. GSV's list of satellites in view is
totally beyond the needs of this project.

So there are 3 sentences of some interest: RMC, GGA and GSA. We clear
want to receive RMC at the highest rate possible. The information in
GGA and GSA are less time-critical. The configuration options limit
the update period options for each sentence to 0, 1, or 5, so the
least frequent sentence has a period 5 times that of the most frequent.

In testing, I found that if I configured RMC at 1 and GGA and GSA at 5
with the basic update rate at 10 Hz, the GPS tended to fall behind with
dropouts of 9.7 seconds approximately every 90 seconds. In the end, I dropped
the GSA mode and DOP data in favor of the altitude data, and that seems
to work OK.

[NMEA]: https://aprs.gids.nl/nmea/ 'NMEA Sentences Reference'
[PMTK]: https://cdn-shop.adafruit.com/datasheets/PMTK_A11.pdf 'PMTK Reference'

