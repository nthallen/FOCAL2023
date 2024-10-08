#ifndef ICM20948_DRV_H_INCLUDED
#define ICM20948_DRV_H_INCLUDED
#include <stdio.h>
#include "dasio/cmd_reader.h"
#include "dasio/tm_data_sndr.h"
#include "subbuspp.h"
#include "ICM20948.h"
#include "mlf.h"

#ifdef USING_CAN
  /* This is the maximum number of word reads allowed by the
   * current implementation on the uDACS16. The limit is determined
   * by the definition of CAN_MAX_TXFR (224) in can_control.h, which
   * sets the maximum number of bytes in the reply message not
   * counting any of the packet overhead. A multiread of the format
   * <addr1>|<count>@<addr2> where <count> is 111 will read up to
   * 112 words, or 224 bytes. Note that although the actual
   * multiread format we use includes some additional reads, those
   * don't count against this total, because the driver has to
   * break the reads into separate requests. Hence:
   *   <addr1>,<addr2>,<addr3>|<count>@<addr4>
   * is implemented as two requests:
   *   <addr1>,<addr2>
   *   <addr3>|<count>@<addr4>
   *
   * The reason for selecting that particular value was not
   * documented. It might have had something to do with trying
   * not to have the sequence counter wrap too much, but I think
   * 224 bytes requires 33 packets (6 + 31*7 + 1), so we are
   * already wrapping by 1 packet.
   *
   * The risk from wrapping is that we could fail to recognize
   * packet loss if exactly 31 packets were dropped.
   * 5/7/2024. Details should be explored in the CAN Subbus Protocol
   * Evernote.
   */
  #define ICM_MAX_MREAD 111
#else
  #define ICM_MAX_MREAD SB_MAX_MREAD
#endif

using namespace DAS_IO;

class ICM_dev : public Interface {
  public:
    ICM_dev();
    /**
     * @param mode: 0: idle, 1: slow updates, 2: fast updates
     */
    void set_mode(uint8_t mode);
    /**
     * @param fs: full scale value 0-3
     * Full scale range for acceleration is 2^(fs+1) g
     */
    void set_fs(uint8_t fs);
    /**
     * @param cmd One of 'P' or 'I', for Gp or Gi
     * @param val The corresponding gain value
     */
    // void set_gain(char cmd, float val);
    /**
     * @param rem The target remainder value
     */
    void set_msec(uint16_t msec);
    /**
     * @param nsync The number of syncs that have been received
     */
    void set_nsync(int nsync);
    /**
     * Called by ICM_cmd_t when a quit command is received.
     */
    void Quit();
    void event_loop();
    static const char *subbusd_service;
    static const int NS = N_ICM20948_SENSORS;
    static const int samples_per_report = 20;
    static const int approx_samples_per_sec = 20;
    static const int max_skip = approx_samples_per_sec; // arbitrary
    static const int max_mread = ICM_MAX_MREAD; // 497;
    static const int udata_size = (samples_per_report+max_skip)*3+2;
    static const char *mlf_config;
    static const int records_per_file = 5;
    static const int n_peaks = N_ICM20948_PEAKS;
  protected:
    bool protocol_timeout();
    void prep_multiread();
    void read_sensors();
    void read_modes();
    // void set_cur_skip(int i, int skip);
    subbuspp *SB;
    mlf_def_t *mlf;
    FILE *ofp;
    int records_in_file;
    struct {
      uint16_t udata[udata_size];
      int16_t (*data)[3];
      char rm_fifo_fmt[32];
      uint16_t nw;
      uint16_t remainder[2];
      bool skip_set;
      int n_rows;
      // uint16_t cur_skip;
      // double msec_err_sum;
      // int nrows_needed;
      // int nwords_needed;
    } dev[NS];
    subbus_mread_req *rm_idle[NS];
    subbus_mread_req *rm_fifo[NS];
    bool quit_requested;
    uint8_t req_mode; ///< Requested mode from cmd
    uint8_t req_fs; ///< Requested fs from cmd
    uint8_t req_modefs; ///< Requested modefs
    uint8_t cmd_modefs[NS]; ///< Commanded modefs
    uint8_t rep_modefs[NS]; ///< Reported modefs
    double Gp, Gi;
    double msec_setpoint;
    double rem_setpoint;
    double msec_err_sum_lim;
    int nsync;
    static const uint16_t uDACS_cmd_addr = 0x30;
    static const uint16_t uDACS_mode_cmd_offset = 40;
    static const uint16_t uDACS_fs_cmd_offset = 50;
    inline uint8_t mask_mode(uint8_t modefs) { return (modefs&7); }
    inline uint8_t mask_fs(uint8_t modefs) { return (modefs>>3); }
    inline uint8_t mask_modefs(uint8_t mode, uint8_t fs) {
      return (mode | (fs<<3));
    }
    static uint16_t base_addr[NS];
};

class ICM_cmd_t : public Cmd_reader {
  public:
    ICM_cmd_t(ICM_dev *ICM);
  protected:
    // ~ICM_cmd_t();
    bool app_input();
    bool not_whitespace(); //*< Always returns false
    ICM_dev *ICM;
};

class ICM_TM_t : public TM_data_sndr {
  public:
    ICM_TM_t(ICM_dev *ICM);
    bool app_input();
  protected:
    // ~ICM_TM_t();
    ICM_dev *ICM;
};

#endif
