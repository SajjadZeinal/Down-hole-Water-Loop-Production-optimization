%X3=UPPER point of water drainage completion
%X4=lower point of water drainage completion
attempt=1;
for ii=20:20:460
x3=15070;
x4=x3+ii;
[N_DI_SPACING,BLOCK_DI_SPACING_LENGTH]=DZ_DI(x3,x4);
fid=fopen('E:\Sajjad\DWL\Sensitivity\DI Spacing Sensitivity\Data\150-R.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
DIMENS_edit=strfind(SCHEDULE_OUT,'DIMENS');
DZ_edit=strfind(SCHEDULE_OUT,'DZLENGTH');
WELL_edit=strfind(SCHEDULE_OUT,'edit');
COORD=strfind(SCHEDULE_OUT,'COORDSYS');
MULTPV=strfind(SCHEDULE_OUT,'MULTPV');
WATER_REINJ_TOP=N_DI_SPACING+15;
WATER_REINJ_BOT=N_DI_SPACING+15+1;
WATER_REINJ_TOP=int2str(WATER_REINJ_TOP);
WATER_REINJ_BOT=int2str(WATER_REINJ_BOT);


SCHEDULE_OUT(WELL_edit+145:WELL_edit+147)='   ';
SCHEDULE_OUT(WELL_edit+145:WELL_edit+145+length(WATER_REINJ_TOP)-1)=WATER_REINJ_TOP;
SCHEDULE_OUT(WELL_edit+150:WELL_edit+152)='   ';
SCHEDULE_OUT(WELL_edit+150:WELL_edit+150+length(WATER_REINJ_BOT)-1)=WATER_REINJ_BOT;






fid=fopen('E:\Sajjad\DWL\Sensitivity\DI Spacing Sensitivity\Data\150-R.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "E:\Sajjad\DWL\Sensitivity\DI Spacing Sensitivity\Data\150-R.data"');
[NPV,totNPV,QOP,QWp,days,QOP_Water_Drainage,QOPT_Water_Drainage]=cal_NPV_Well_DWL;
Results(1:length(days),attempt)=days;
Results(1:length(QOP),attempt+1)=QOP;
Results(1:length(QWp),attempt+2)=QWp;
Results(1:length(NPV),attempt+3)=NPV;
Results(1:length(NPV),attempt+4)=totNPV;
Results(1:length(NPV),attempt+5)=x4;
Results(1:length(NPV),attempt+6)=QOPT_Water_Drainage;
attempt=attempt+7;
end