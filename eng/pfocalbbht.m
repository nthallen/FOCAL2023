function pfocalbbht(varargin);
% pfocalbbht( [...] );
% Bay Bay Heat Temp
h = timeplot({'Bay_Heat_T','Bay_Heat_Set_T','Bay_Heat_Sink_T'}, ...
      'Bay Bay Heat Temp', ...
      'Temp', ...
      {'Bay\_Heat\_T','Bay\_Heat\_Set\_T','Bay\_Heat\_Sink\_T'}, ...
      varargin{:} );