function pfocalgdscoedt(varargin);
% pfocalgdscoedt( [...] );
% COE Det Tmon
h = timeplot({'CO2_Ref_Det_Tmon','CO2_Sig_Det_Tmon'}, ...
      'COE Det Tmon', ...
      'Det Tmon', ...
      {'Ref','Sig'}, ...
      varargin{:} );
