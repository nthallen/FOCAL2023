function pfocalchchqclt(varargin);
% pfocalchchqclt( [...] );
% CH4 CH4 QCL Temp
h = timeplot({'CH4_QCL_T','CH4_QCL_Set_T','CH4_QCL_Sink_T'}, ...
      'CH4 CH4 QCL Temp', ...
      'Temp', ...
      {'CH4\_QCL\_T','CH4\_QCL\_Set\_T','CH4\_QCL\_Sink\_T'}, ...
      varargin{:} );