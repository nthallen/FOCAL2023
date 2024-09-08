# ICM20948 Accelerometer Driver 

This driver is specifically focused on retrieving accelerometer
data from an Adafruit TDK InvenSense ICM-20948 9-DoF IMU
by way of an Arduino Feather M4 CAN Express. The
(Feather firmware)[https://github.com/nthallen/FOCAL2024Accel]
handles the I2C communication with the ICM20948 and makes the
data available to a host via a serial connection.[^1] This
driver runs on the host and is built on the
(Monarch framework)[https://github.com/nthallen/monarch].

As is standard for monarch drivers, ICM20948 is designed around
three interfaces:

  1. The interface to the device (the ICM20948 through the Feather)
  2. The command interface to receive commands for the device
  3. The telemetry interface to send data to telemetry

Each interface has an associated class derived from monarch's
DAS_IO::Interface class. The command and telemetry interfaces
are pretty standard implementations. The ICM_dev class is
based on a somewhat experimental approach designed to minimize
latency in reporting the data. Ordinarily, most routine data is
sent to telemetry at 1 Hz based on a synchronization message from
the telemetry collection process. Immediately after sending the
data, the driver begins aquiring data for the next report to
ensure it is ready in time. With higher rate data, the process
of retrieving the data from the device cannot necessarily be
delayed, even if the device firmware provides a robust FIFO.
Retrieving the data that has been enqueued at the beginning of
the sample period, means there will be a latency of many samples.
The ideal approach will be retrieving the data more or less
continuously throughout the sample period, then reporting the
latest values at the report time.

If the device firmware were designed to continually send the
data, this would fall within the standard approach, but we have
chosen to implement the driver using the subbus model, which
gives us much more flexibility, but requires polling for data.

### rm_fifo explanation

rm_fifo is an array of subbus_mread_req objects, which support
reading multiple values from a subbus interface with a flexible
format. In this case, instead of using a constant format for
each request, we are using a template format that is adjusted
for each request. The format of the final request is
`M$1#$2,$3|$4@$5`, where all the $N values are hex-encoded
unsigned integers. The portion of the request after the `#`
is a comma-separated list requests. The first one is for a
single address. The second is a special format for reading
from a FIFO: `A|B@C`. A is the address of the FIFO's
count register that reports the number of words that are
currently available in the FIFO. B is the maximum number of
values we are able to read. C is the address of the FIFO
register. This will return the value of the count register
followed by multiple values from the FIFO up to the maximum
value (B).

  - $1 is the maximum number of values that will be read
  - $2 is the first address to be read (the mode register)
  - $3 is FIFO count register address
  - $4 is the maximum number of values we want from the FIFO
  - $5 is the FIFO address

Parameters $2, $3 and $5 never change, but $1 and $4 need to
be updated each time. $1 will be $4+2, since the total read
includes the mode register and the FIFO count register values
in addition to the $4 FIFO values.

[^1]: The Feather firmware can also be configured to use the CAN
interface, but I have run into problems retrieving CAN data
at higher data rates.
