function pfocalgdsgdst(varargin);
% pfocalgdsgdst( [...] );
% GDS Temps
h = timeplot({'Rov1_T','Rov2_T','Rov3_T','Rov4_T','Rov5_T','Rov6_T','MM_Pump_T','MM_Mot_T','CO2_Pump_T','CO2_Mot_T','GDS_MS_T'}, ...
      'GDS Temps', ...
      'Temps', ...
      {'Rov1\_T','Rov2\_T','Rov3\_T','Rov4\_T','Rov5\_T','Rov6\_T','MM\_Pump\_T','MM\_Mot\_T','CO2\_Pump\_T','CO2\_Mot\_T','GDS\_MS\_T'}, ...
      varargin{:} );
