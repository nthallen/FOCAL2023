%{
  #ifdef SERVER

  #include "subbuspp.h"

  subbuspp *uDCO2;
  subbuspp *uDCH4;

  void uDCO2_wr(uint16_t addr, uint16_t val) {
    if (uDCO2 && uDCO2->fd >= 0) {
      uDCO2->write_ack(addr, val);
    }
  }

  void uDCH4_wr(uint16_t addr, uint16_t val) {
    if (uDCH4 && uDCH4->fd >= 0) {
      uDCH4->write_ack(addr, val);
    }
  }

  /**
   * @param name must be one of "uDCO2" or "uDCH4"
   */
  void uDACS_init(const char *name) {
    msg(0, "uDACS_init(%s)", name);
    subbuspp *uD, **uDP;
    if (strcmp(name, "uDCO2") == 0) {
      uDP = &uDCO2;
    } else if (strcmp(name, "uDCH4") == 0) {
      uDP = &uDCH4;
    } else {
      msg(2, "Invalid name '%s' in uDACS_init()", name);
      return;
    }
    uD = new subbuspp(name, "serusb");
    *uDP = uD;
    msg(0, "%s->load()", name);
    int subfunc = uD->load();
    if (subfunc == 0) {
      msg(2, "subbus %s->load() failed", name);
    }
  }
  
  void uDACS_init() {
    uDACS_init("uDCH4");
    uDACS_init("uDCO2");
  }
  
  #else // Not SERVER

  void uDACS_init() {}

  #endif
%}

&command
  : Set uDCO2 Vout %d (0-3) %d (bits) bits * {
      if ($4 >= 0 && $4 < 4) {
        uDCO2_wr(0x10 + $4, $5);
      }
    }
  : Set uDCH4 Vout %d (0-3) %d (bits) bits * {
      if ($4 >= 0 && $4 < 4) {
        uDCH4_wr(0x10 + $4, $5);
      }
    }
  : Set uDCO2 Baratron Vrtn &uDACS_DAC_V * {
      uDCO2_wr(0x11, $5);
    }
  : Set uDCH4 Baratron Vrtn &uDACS_DAC_V * {
      uDCH4_wr(0x11, $5);
    }
  ;

&uDACS_DAC_V <uint16_t>
  : %f (Volts) Volts {
      double counts = $1 * 65536./5.;
      uint16_t icounts;
      if (counts < 0) icounts = 0;
      else if (counts > 65535) icounts = 65535;
      else icounts = (uint16_t)counts;
      $0 = icounts;
    }
  ;
