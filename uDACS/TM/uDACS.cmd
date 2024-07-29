%{
  #ifdef SERVER

  #include "subbuspp.h"

  subbuspp *uD_COE;
  subbuspp *uD_MOE;

  void uD_COE_wr(uint16_t addr, uint16_t val) {
    if (uD_COE && uD_COE->fd >= 0) {
      uD_COE->write_ack(addr, val);
    }
  }

  void uD_MOE_wr(uint16_t addr, uint16_t val) {
    if (uD_MOE && uD_MOE->fd >= 0) {
      uD_MOE->write_ack(addr, val);
    }
  }

  /**
   * @param name must be one of "uD_COE" or "uD_MOE"
   */
  void uDACS_init(const char *name) {
    // msg(0, "uDACS_init(%s)", name);
    subbuspp *uD, **uDP;
    if (strcmp(name, "uD_COE") == 0) {
      uDP = &uD_COE;
    } else if (strcmp(name, "uD_MOE") == 0) {
      uDP = &uD_MOE;
    } else {
      msg(2, "Invalid name '%s' in uDACS_init()", name);
      return;
    }
    uD = new subbuspp(name, "serusb");
    *uDP = uD;
    // msg(0, "%s->load()", name);
    int subfunc = uD->load();
    if (subfunc == 0) {
      msg(2, "subbus %s->load() failed", name);
    }
  }
  
  void uDACS_init() {
    uDACS_init("uD_MOE");
    uDACS_init("uD_COE");
  }
  
  #else // Not SERVER

  void uDACS_init() {}

  #endif
%}

&command
  : Set uD_COE Vout %d (0-3) %d (bits) bits * {
      if ($4 >= 0 && $4 < 4) {
        uD_COE_wr(0x10 + $4, $5);
      }
    }
  : Set uD_MOE Vout %d (0-3) %d (bits) bits * {
      if ($4 >= 0 && $4 < 4) {
        uD_MOE_wr(0x10 + $4, $5);
      }
    }
  : Set uD_COE Baratron Vrtn &uDACS_DAC_V * {
      uD_COE_wr(0x11, $5);
    }
  : Set uD_MOE Baratron Vrtn &uDACS_DAC_V * {
      uD_MOE_wr(0x11, $5);
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
