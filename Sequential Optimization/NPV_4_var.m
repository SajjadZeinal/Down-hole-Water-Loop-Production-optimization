function cal_NPV=NPV_4_var(x)
global attempt2 NPV_MATRIX
QW=num2str(x(1));
OIL_WELL_COMPLETION=num2str(x(2));
OIL_WELL_COMPLETION_int=x(2);
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC=num2str(x(3));
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_int=x(3);
WATER_DRAINAGE_WELL_COMPLETION=num2str(x(4));
WATER_DRAINAGE_WELL_COMPLETION_int=x(4);
Top_Water_Injection_Depth = x(5);
D_I_Spacing_int=x(5) - x(4);
D_I_Spacing_str=num2str(D_I_Spacing_int);
fid=fopen('H:\Univercity documents\master\Project\Work over\Final\DWL\Optimization\Sequential\Data\Wojtanovic.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
DIMENS_edit=strfind(SCHEDULE_OUT,'DIMENS');
DZ_edit=strfind(SCHEDULE_OUT,'DZLENGTH');
WELL_edit=strfind(SCHEDULE_OUT,'edit');
COORD=strfind(SCHEDULE_OUT,'COORDSYS');
MULTPV=strfind(SCHEDULE_OUT,'MULTPV');
edit_point=strfind(SCHEDULE_OUT,'limit');

% Water Drainage Rate Write 
SCHEDULE_OUT(edit_point+118:edit_point+129)='            ';
SCHEDULE_OUT(edit_point+118:edit_point+118+length(QW)-1)=QW;

% OIL Well Completion Write
[  OIL_PERF_LENGTH , N_OIL_BLOCK , LOWER_OIL_LENGTH , N_LOWER_OIL  ] = DZ_EDIT_OIL(OIL_WELL_COMPLETION_int , 15000);
SCHEDULE_OUT(DZ_edit+17:DZ_edit+26)='          ';
SCHEDULE_OUT(DZ_edit+17:DZ_edit+17+length(OIL_PERF_LENGTH)-1)=OIL_PERF_LENGTH;
SCHEDULE_OUT(DZ_edit+44:DZ_edit+46)='   ';
SCHEDULE_OUT(DZ_edit+44:DZ_edit+44+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
SCHEDULE_OUT(WELL_edit+26:WELL_edit+28)='   ';
SCHEDULE_OUT(WELL_edit+26:WELL_edit+26+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
if OIL_WELL_COMPLETION_int == 15050
SCHEDULE_OUT(DZ_edit+81:DZ_edit+83)='   ';
SCHEDULE_OUT(DZ_edit+81:DZ_edit+81+length('1')-1)='1';
SCHEDULE_OUT(DZ_edit+86:DZ_edit+88)='   ';
SCHEDULE_OUT(DZ_edit+86:DZ_edit+86+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
SCHEDULE_OUT(DZ_edit+59:DZ_edit+68)='          ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length(OIL_PERF_LENGTH)-1)=OIL_PERF_LENGTH;
SCHEDULE_OUT(MULTPV+31:MULTPV+33)='   ';
SCHEDULE_OUT(MULTPV+31:MULTPV+31+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
BOTTOM_OIL_ZONE = N_OIL_BLOCK;
else
SCHEDULE_OUT(DZ_edit+86:DZ_edit+88)='   ';
SCHEDULE_OUT(DZ_edit+86:DZ_edit+86+length(N_LOWER_OIL )-1)=N_LOWER_OIL ;
SCHEDULE_OUT(MULTPV+31:MULTPV+33)='   ';
SCHEDULE_OUT(MULTPV+31:MULTPV+31+length(N_LOWER_OIL)-1)=N_LOWER_OIL;
SCHEDULE_OUT(DZ_edit+59:DZ_edit+68)='          ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length(LOWER_OIL_LENGTH)-1)=LOWER_OIL_LENGTH;
N_OIL_BLOCK_int=str2num(N_OIL_BLOCK);
N_OIL_BOTTOM=num2str(N_OIL_BLOCK_int+1);
SCHEDULE_OUT(DZ_edit+81:DZ_edit+83)='   ';
SCHEDULE_OUT(DZ_edit+81:DZ_edit+81+length(N_OIL_BOTTOM)-1)=N_OIL_BOTTOM;
BOTTOM_OIL_ZONE = N_LOWER_OIL;
end

% DISTANCE_TOP_WATER_DRAINAGE_TO_WOC & Water Drainage completion write
if OIL_WELL_COMPLETION_int == 15050
N_OIL_BLOCK_int_2=str2num(N_OIL_BLOCK);
N_OIL_BOTTOM_2=num2str(N_OIL_BLOCK_int_2+1);
SCHEDULE_OUT(DZ_edit+125:DZ_edit+128)='    ';
SCHEDULE_OUT(DZ_edit+125:DZ_edit+125+length(N_OIL_BOTTOM_2)-1)=N_OIL_BOTTOM_2; 
else
N_OIL_BLOCK_int_2=str2num(N_LOWER_OIL);
N_OIL_BOTTOM_2=num2str(N_OIL_BLOCK_int_2+1);
SCHEDULE_OUT(DZ_edit+125:DZ_edit+128)='    ';
SCHEDULE_OUT(DZ_edit+125:DZ_edit+125+length(N_OIL_BOTTOM_2)-1)=N_OIL_BOTTOM_2;
end

[BLOCK_WATER , N_WATER] = DZ_EDIT_WATER(  WATER_DRAINAGE_WELL_COMPLETION_int , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_int  );
if DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_int == 15050
BLOCK_WATER_str=num2str(BLOCK_WATER);    
N_WATER_2 = num2str( N_WATER + N_OIL_BLOCK_int_2);
SCHEDULE_OUT(DZ_edit+130:DZ_edit+133)='    ';
SCHEDULE_OUT(DZ_edit+130:DZ_edit+130+length(N_WATER_2)-1)=N_WATER_2; 
SCHEDULE_OUT(DZ_edit+103:DZ_edit+112)='          ';
SCHEDULE_OUT(DZ_edit+103:DZ_edit+103+length(BLOCK_WATER_str)-1)=BLOCK_WATER_str;
SCHEDULE_OUT(DZ_edit+146:DZ_edit+155)='          ';
SCHEDULE_OUT(DZ_edit+146:DZ_edit+146+length(BLOCK_WATER_str)-1)=BLOCK_WATER_str;
SCHEDULE_OUT(DZ_edit+168:DZ_edit+171)='    ';
SCHEDULE_OUT(DZ_edit+168:DZ_edit+168+length(N_OIL_BOTTOM_2)-1)=N_OIL_BOTTOM_2;
WATER_DRAINAGE_TOP_BLOCK_str = N_OIL_BOTTOM_2; 
SCHEDULE_OUT(DZ_edit+173:DZ_edit+176)='    ';
SCHEDULE_OUT(DZ_edit+173:DZ_edit+173+length(N_WATER_2)-1)=N_WATER_2;
WATER_DRAINAGE_BOTTOM_BLOCK_str = N_WATER_2 ;
N_WATER_DRAINAGE_COMPLETION=str2num(N_WATER_2);
N_DIST=0;
BLOCK_DIST=str2num(BLOCK_WATER_str);
else 

[ BLOCK_DIST , N_DIST  ] = DZ_EDIT_DIST_WOC(DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_int , 15050);
BLOCK_DIST_str=num2str(BLOCK_DIST);
BLOCK_WATER_str=num2str(BLOCK_WATER);
N_OIL_BOTTOM_2_int = str2num(N_OIL_BOTTOM_2);
N_DIST_str=num2str(N_OIL_BOTTOM_2_int+N_DIST-1); 
SCHEDULE_OUT(DZ_edit+130:DZ_edit+133)='    ';
SCHEDULE_OUT(DZ_edit+130:DZ_edit+130+length(N_DIST_str)-1)=N_DIST_str;
SCHEDULE_OUT(DZ_edit+103:DZ_edit+112)='          ';
SCHEDULE_OUT(DZ_edit+103:DZ_edit+103+length(BLOCK_DIST_str)-1)=BLOCK_DIST_str;
SCHEDULE_OUT(DZ_edit+146:DZ_edit+155)='          ';
SCHEDULE_OUT(DZ_edit+146:DZ_edit+146+length(BLOCK_WATER_str)-1)=BLOCK_WATER_str;
N_DIST_int=str2num(N_DIST_str);
N_TOP_WATER_DRAINAGE_str=num2str(N_DIST_int+1);
SCHEDULE_OUT(DZ_edit+168:DZ_edit+171)='    ';
SCHEDULE_OUT(DZ_edit+168:DZ_edit+168+length(N_TOP_WATER_DRAINAGE_str)-1)=N_TOP_WATER_DRAINAGE_str;
WATER_DRAINAGE_TOP_BLOCK_str = N_TOP_WATER_DRAINAGE_str;
N_WATER_DRAINAGE_COMPLETION=N_WATER+N_DIST_int;
N_WATER_DRAINAGE_COMPLETION_str=num2str(N_WATER_DRAINAGE_COMPLETION);
SCHEDULE_OUT(DZ_edit+173:DZ_edit+176)='    ';
SCHEDULE_OUT(DZ_edit+173:DZ_edit+173+length(N_WATER_DRAINAGE_COMPLETION_str)-1)=N_WATER_DRAINAGE_COMPLETION_str;
WATER_DRAINAGE_BOTTOM_BLOCK_str = N_WATER_DRAINAGE_COMPLETION_str; 
end

% D/I Spacing & Water Injection Completion
if WATER_DRAINAGE_WELL_COMPLETION_int == 15050 
    TOP_WATER_INJECTION_COMPLETION_HEIGHT = WATER_DRAINAGE_WELL_COMPLETION_int + D_I_Spacing_int + 5;
else 
    TOP_WATER_INJECTION_COMPLETION_HEIGHT = WATER_DRAINAGE_WELL_COMPLETION_int + D_I_Spacing_int ;
end
    [N_DI_SPACING,BLOCK_DI_SPACING_LENGTH]=DZ_DI(WATER_DRAINAGE_WELL_COMPLETION_int,Top_Water_Injection_Depth);
    TOP_DI_SPACING = N_WATER_DRAINAGE_COMPLETION + 1;
    TOP_DI_SPACING_str = num2str(TOP_DI_SPACING);
    N_DI_SPACING_str = num2str(N_DI_SPACING + N_WATER_DRAINAGE_COMPLETION);
    N_DI_SPACING_int = N_DI_SPACING + N_WATER_DRAINAGE_COMPLETION;
    BLOCK_DI_SPACING_LENGTH_str = num2str(BLOCK_DI_SPACING_LENGTH);
    SCHEDULE_OUT(DZ_edit+188:DZ_edit+197)='          ';
    SCHEDULE_OUT(DZ_edit+188:DZ_edit+188+length(BLOCK_DI_SPACING_LENGTH_str)-1)=BLOCK_DI_SPACING_LENGTH_str;
    SCHEDULE_OUT(DZ_edit+210:DZ_edit+213)='    ';
    SCHEDULE_OUT(DZ_edit+210:DZ_edit+210+length(TOP_DI_SPACING_str)-1)=TOP_DI_SPACING_str;
    SCHEDULE_OUT(DZ_edit+215:DZ_edit+218)='    ';
    SCHEDULE_OUT(DZ_edit+215:DZ_edit+215+length(N_DI_SPACING_str)-1)=N_DI_SPACING_str;
    TOP_WATER_INJ_int = N_DI_SPACING_int + 1; 
    TOP_WATER_INJ_str = num2str(TOP_WATER_INJ_int);
    N_WATER_INJ_int = N_WATER + TOP_WATER_INJ_int - 1;
    N_WATER_INJ_str = num2str(N_WATER_INJ_int);
    SCHEDULE_OUT(DZ_edit+252:DZ_edit+255)='    ';
    SCHEDULE_OUT(DZ_edit+252:DZ_edit+252+length(TOP_WATER_INJ_str)-1)=TOP_WATER_INJ_str;
    SCHEDULE_OUT(DZ_edit+257:DZ_edit+260)='    ';
    SCHEDULE_OUT(DZ_edit+257:DZ_edit+257+length(N_WATER_INJ_str)-1)=N_WATER_INJ_str;
    SCHEDULE_OUT(DZ_edit+230:DZ_edit+239)='          ';
    SCHEDULE_OUT(DZ_edit+230:DZ_edit+230+length(BLOCK_WATER_str)-1)=BLOCK_WATER_str;
    
% Below of Water INJECTION
BOTTOM_WATER_INJECTION_HEIGHT = 2*N_WATER*BLOCK_WATER + N_DI_SPACING*BLOCK_DI_SPACING_LENGTH + N_DIST*BLOCK_DIST + 50 + 15000; 
if BOTTOM_WATER_INJECTION_HEIGHT == 15550
    SCHEDULE_OUT(DZ_edit+272:DZ_edit+281)='          ';
    SCHEDULE_OUT(DZ_edit+272:DZ_edit+272+length(BLOCK_WATER_str)-1)=BLOCK_WATER_str;
    SCHEDULE_OUT(DZ_edit+294:DZ_edit+297)='    ';
    SCHEDULE_OUT(DZ_edit+294:DZ_edit+294+length(TOP_WATER_INJ_str)-1)=TOP_WATER_INJ_str;
    SCHEDULE_OUT(DZ_edit+299:DZ_edit+302)='    ';
    SCHEDULE_OUT(DZ_edit+299:DZ_edit+299+length(N_WATER_INJ_str)-1)=N_WATER_INJ_str;
    TOTAL_VERTICAL_BLOCK_int = N_WATER_INJ_int;
else
  [BLOCK_BELOW_WATER_LENGTH , N_BELOW_WATER] = DZ_EDIT_BELOW_WATER_DRAINAGE(15550 , BOTTOM_WATER_INJECTION_HEIGHT);
  BLOCK_BELOW_WATER_LENGTH_str = num2str(BLOCK_BELOW_WATER_LENGTH);
  SCHEDULE_OUT(DZ_edit+272:DZ_edit+281)='          ';
  SCHEDULE_OUT(DZ_edit+272:DZ_edit+272+length(BLOCK_BELOW_WATER_LENGTH_str)-1)=BLOCK_BELOW_WATER_LENGTH_str;      
  TOP_BELOW_WATER_INJ_int = N_WATER_INJ_int + 1;
  TOP_BELOW_WATER_INJ_str = num2str(TOP_BELOW_WATER_INJ_int);
  SCHEDULE_OUT(DZ_edit+294:DZ_edit+297)='    ';
  SCHEDULE_OUT(DZ_edit+294:DZ_edit+294+length(TOP_BELOW_WATER_INJ_str)-1)=TOP_BELOW_WATER_INJ_str;
  Bottom_BELOW_WATER_INJ_int = TOP_BELOW_WATER_INJ_int + N_BELOW_WATER - 1; 
  Bottom_BELOW_WATER_INJ_str = num2str(Bottom_BELOW_WATER_INJ_int);
  SCHEDULE_OUT(DZ_edit+299:DZ_edit+302)='    ';
  SCHEDULE_OUT(DZ_edit+299:DZ_edit+299+length(Bottom_BELOW_WATER_INJ_str)-1)=Bottom_BELOW_WATER_INJ_str;
  TOTAL_VERTICAL_BLOCK_int = Bottom_BELOW_WATER_INJ_int; 
end

% Well Edit
SCHEDULE_OUT(WELL_edit+87:WELL_edit+89)='   ';
SCHEDULE_OUT(WELL_edit+87:WELL_edit+87+length(WATER_DRAINAGE_TOP_BLOCK_str)-1)=WATER_DRAINAGE_TOP_BLOCK_str;
SCHEDULE_OUT(WELL_edit+92:WELL_edit+94)='   ';
SCHEDULE_OUT(WELL_edit+92:WELL_edit+92+length(WATER_DRAINAGE_BOTTOM_BLOCK_str)-1)=WATER_DRAINAGE_BOTTOM_BLOCK_str;
SCHEDULE_OUT(WELL_edit+147:WELL_edit+149)='   ';
SCHEDULE_OUT(WELL_edit+147:WELL_edit+147+length(TOP_WATER_INJ_str)-1)=TOP_WATER_INJ_str;
SCHEDULE_OUT(WELL_edit+152:WELL_edit+154)='   ';
SCHEDULE_OUT(WELL_edit+152:WELL_edit+152+length( N_WATER_INJ_str)-1)= N_WATER_INJ_str;
SCHEDULE_OUT(WELL_edit+214:WELL_edit+216)='   ';
SCHEDULE_OUT(WELL_edit+214:WELL_edit+214+length( BOTTOM_OIL_ZONE)-1)= BOTTOM_OIL_ZONE;
BELOW_OF_BOTTOM_OIL_ZONE_str =num2str(str2num(BOTTOM_OIL_ZONE) + 1) ;
SCHEDULE_OUT(WELL_edit+269:WELL_edit+271)='   ';
SCHEDULE_OUT(WELL_edit+269:WELL_edit+269+length( BELOW_OF_BOTTOM_OIL_ZONE_str)-1)= BELOW_OF_BOTTOM_OIL_ZONE_str;
TOTAL_VERTICAL_BLOCK_str=num2str(TOTAL_VERTICAL_BLOCK_int);
SCHEDULE_OUT(WELL_edit+274:WELL_edit+276)='   ';
SCHEDULE_OUT(WELL_edit+274:WELL_edit+274+length(TOTAL_VERTICAL_BLOCK_str)-1)= TOTAL_VERTICAL_BLOCK_str;

%Dimens Edit
SCHEDULE_OUT(DIMENS_edit+18:DIMENS_edit+20)='   ';
SCHEDULE_OUT(DIMENS_edit+18:DIMENS_edit+18+length( TOTAL_VERTICAL_BLOCK_str)-1)= TOTAL_VERTICAL_BLOCK_str;

%COORDSYS EDIT
SCHEDULE_OUT(COORD+22:COORD+24)='   ';
SCHEDULE_OUT(COORD+22:COORD+22+length( TOTAL_VERTICAL_BLOCK_str)-1)= TOTAL_VERTICAL_BLOCK_str;


fid=fopen('H:\Univercity documents\master\Project\Work over\Final\DWL\Optimization\Sequential\Data\Wojtanovic.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "H:\Univercity documents\master\Project\Work over\Final\DWL\Optimization\Sequential\Data\Wojtanovic.data"');
[NPV,totNPV,QOP,QWp,days,QOP_Water_Drainage,QOPT_Water_Drainage]=cal_NPV_Well_DWL;
NPV_MATRIX(1:length(days),attempt2)=days;
NPV_MATRIX(1:length(QOP),attempt2+1)=QOP;
NPV_MATRIX(1:length(QWp),attempt2+2)=QWp;
NPV_MATRIX(1:length(NPV),attempt2+3)=NPV;
NPV_MATRIX(1:length(NPV),attempt2+4)=totNPV;
NPV_MATRIX(1:length(NPV),attempt2+5)=QOPT_Water_Drainage;
attempt2 = attempt2 + 6;
cal_NPV=totNPV;
fclose all;
end
