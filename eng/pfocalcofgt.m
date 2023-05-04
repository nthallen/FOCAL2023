function pfocalcofgt(varargin);
% pfocalcofgt( [...] );
% CO2 Fwd Gas Temp
h = timeplot({'Fwd_Gas_T','Fwd_Gas_Set_T','Fwd_Gas_Sink_T'}, ...
      'CO2 Fwd Gas Temp', ...
      'Temp', ...
      {'Fwd\_Gas\_T','Fwd\_Gas\_Set\_T','Fwd\_Gas\_Sink\_T'}, ...
      varargin{:} );