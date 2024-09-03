classdef SSP_state < handle
  properties
    dfs
    hostname
    homedir
    basedir
    localbase
    rembase
    recname
    rec_time_varname
    filenum_varname
    signal_varname
    etalon_varname
    ref_varname
    cur_filenum
    latest_filenum
    latest_time
    retrieving
    scp_cmd
  end

  methods
    function ssps = SSP_state(opts, basedir, filenum, ...
                              signame, etlnname, refname)
      if nargin < 6
        refname = '';
      end
      ssps.dfs = opts.dfs;
      ssps.hostname = opts.hostname;
      ssps.homedir = opts.homedir;
      ssps.basedir = basedir;
      ssps.filenum_varname = filenum;
      ssps.signal_varname = signame;
      ssps.etalon_varname = etlnname;
      ssps.ref_varname = refname;
      ssps.cur_filenum = 0;
      ssps.latest_filenum = 0;
      ssps.retrieving = false;
      ssps.recname = [ basedir '_rec' ];
      ssps.rec_time_varname = ['T' ssps.recname];
      if ispc
        localhome = [ 'C:\cygwin64' ssps.homedir ];
        ssps.scp_cmd = 'C:\cygwin64\bin\scp';
      else
        localhome = ssps.homedir;
        ssps.scp_cmd = 'scp';
      end
      if ~exist(localhome,'dir')
        error('SSP_state: local home dir not found: %s', localhome);
      end
      if ~isempty(ssps.hostname)
        localbase = [ localhome filesep 'RT' ];
        if ~exist(localbase,'dir') && mkdir(localbase) == 0
          error('SSP_state: unable to create: %s', localhome);
        end
      else
        localbase = localhome;
      end
      localbase = [ localbase filesep basedir ];
      if ~exist(localbase,'dir')
        if ~isempty(ssps.hostname) && mkdir(localbase) == 0
          error('SSP_state: unable to create: %s', localbase);
        else
          error('SSP_state: local base not found: %s', localbase);
        end
      end
      ssps.localbase = localbase;
      ssps.rembase = [ ssps.homedir filesep basedir ];
    end

    function new_filenum(ssps, time, filenum)
      if filenum > ssps.latest_filenum
        ssps.latest_filenum = filenum;
        ssps.latest_time = time;
        if ~ssps.retrieving
          ssps.retrieve();
        end
      end
    end

    function retrieve(ssps)
      if ~ssps.retrieving
        ssps.retrieving = true;
        while ssps.cur_filenum < ssps.latest_filenum
          ssps.cur_filenum = ssps.latest_filenum;
          % Do the stuff:
          % mlf housekeeping to prepare, then
          localpath = mlf_path(ssps.localbase, ssps.cur_filenum);
          if ~isempty(ssps.hostname)
            mlf_mkdir(ssps.localbase, ssps.cur_filenum);
            rempath = mlf_path(ssps.rembase, ssps.cur_filenum);
            % Invoke scp to retrieve the scan
            system([ssps.scp_cmd ' ' ssps.hostname ':' rempath ' ' localpath]);
          end
          % then loadbin
          fe = loadbin(localpath);
          if ~isempty(fe)
            % create/update the data_record
            str.(ssps.rec_time_varname) = ssps.latest_time;
            str.(ssps.signal_varname) = fe(:,1);
            str.(ssps.etalon_varname) = fe(:,2);
            if ~isempty(ssps.ref_varname)
              str.(ssps.ref_varname) = fe(:,3);
            end
            ssps.dfs.process_record(ssps.recname,str);
          end
        end
        ssps.retrieving = false;
      end
    end

  end
end
