%X3=UPPER point of water drainage completion
%X4=lower point of water drainage completion
attempt=1;
for ii=5:5:145
x3=15050;
%x4=x3+ii;
x4=x3+150;
[ BLOCK_WATER , N_WATER ]=DZ_EDIT(x4,x3);
fid=fopen('H:\Univercity documents\master\Project\Work over\Final\DWL\Sensitivity\Water Production Completion\Test\150-R.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
DIMENS_edit=strfind(SCHEDULE_OUT,'DIMENS');
DZ_edit=strfind(SCHEDULE_OUT,'DZLENGTH');
WELL_edit=strfind(SCHEDULE_OUT,'edit');
COORD=strfind(SCHEDULE_OUT,'COORDSYS');
MULTPV=strfind(SCHEDULE_OUT,'MULTPV');

WATER_DRAINAIGE_BOT=N_WATER+10;
WATER_REINJ_TOP=WATER_DRAINAIGE_BOT+41;
WATER_REINJ_BOT=WATER_REINJ_TOP+N_WATER-1;
WATER_DRAINAIGE_BOT=int2str(WATER_DRAINAIGE_BOT);
WATER_REINJ_TOP=int2str(WATER_REINJ_TOP);
WATER_REINJ_BOT=int2str(WATER_REINJ_BOT);


SCHEDULE_OUT(DZ_edit+44:DZ_edit+46)='   ';
SCHEDULE_OUT(DZ_edit+44:DZ_edit+44+length(WATER_DRAINAIGE_BOT)-1)=WATER_DRAINAIGE_BOT;
SCHEDULE_OUT(DZ_edit+80:DZ_edit+82)='   ';
SCHEDULE_OUT(DZ_edit+80:DZ_edit+80+length(WATER_REINJ_TOP)-1)=WATER_REINJ_TOP;
SCHEDULE_OUT(DZ_edit+85:DZ_edit+87)='   ';
SCHEDULE_OUT(DZ_edit+85:DZ_edit+85+length(WATER_REINJ_BOT)-1)=WATER_REINJ_BOT;


SCHEDULE_OUT(DZ_edit+18:DZ_edit+19)='  ';
SCHEDULE_OUT(DZ_edit+18:DZ_edit+18+length('5')-1)='5';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+60)='  ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length('5')-1)='5';


SCHEDULE_OUT(WELL_edit+90:WELL_edit+91)='  ';
SCHEDULE_OUT(WELL_edit+90:WELL_edit+90+length(WATER_DRAINAIGE_BOT)-1)=WATER_DRAINAIGE_BOT;
SCHEDULE_OUT(WELL_edit+145:WELL_edit+146)='  ';
SCHEDULE_OUT(WELL_edit+145:WELL_edit+145+length(WATER_REINJ_TOP)-1)=WATER_REINJ_TOP;
SCHEDULE_OUT(WELL_edit+150:WELL_edit+151)='  ';
SCHEDULE_OUT(WELL_edit+150:WELL_edit+150+length(WATER_REINJ_BOT)-1)=WATER_REINJ_BOT;






fid=fopen('H:\Univercity documents\master\Project\Work over\Final\DWL\Sensitivity\Water Production Completion\Test\150-R.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "H:\Univercity documents\master\Project\Work over\Final\DWL\Sensitivity\Water Production Completion\Test\150-R.data"');
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