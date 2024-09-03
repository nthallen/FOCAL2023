classdef SSP_scan < data_axis
  properties
    state % SSP_state class object
    myvarname
    myline
  end

  methods
    function ssp = SSP_scan(ssps, myvar, dfs, parent, label, ts)
      ssp = ssp@data_axis(dfs, parent, label, ts);
      ssp.state = ssps;
      ssp.myvarname = myvar;
      ssp.myline = [];
    end

    function check_validity(~, ~)
    end

    function update(ssp, rec_name)
      if isfield(ssp.linesbyrec,rec_name) % if we are plotting any data
        dr = ssp.dfs.records.records.(rec_name);
        if isfield(dr.data,ssp.state.filenum_varname)
          [T,V] = dr.time_vector(2);
          D = dr.data_vector(ssp.state.filenum_varname, V);
          ssp.state.new_filenum(T(end),D(end));
        elseif isfield(dr.data,ssp.myvarname)
          D = dr.data.(ssp.myvarname);
          X = 1:length(D);
          if isempty(ssp.myline)
            ssp.myline = plot(ssp.axis,X,D);
            ylabel(ssp.axis,ssp.myvarname);
          else
            set(ssp.myline,'XData',X,'YData',D);
          end
        end
      end
    end
  end
end
