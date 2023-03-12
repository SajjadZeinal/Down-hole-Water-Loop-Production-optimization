%X3=UPPER point of water drainage completion
%X4=lower point of water drainage completion
attempt=1;
for ii=0:20:280
x3=15050;
x4=x3+ii;
[ BLOCK_WOC_DIS , N_WOC_DIS ]=DZ_EDIT(x4,x3);
fid=fopen('E:\Sajjad\DWL\Sensitivity\Distance from WOC\Data\150-R.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
DIMENS_edit=strfind(SCHEDULE_OUT,'DIMENS');
DZ_edit=strfind(SCHEDULE_OUT,'DZLENGTH');
WELL_edit=strfind(SCHEDULE_OUT,'edit');
COORD=strfind(SCHEDULE_OUT,'COORDSYS');
MULTPV=strfind(SCHEDULE_OUT,'MULTPV');
WATER_DRAINAIGE_TOP=N_WOC_DIS+11;
WATER_DRAINAIGE_BOT=N_WOC_DIS+11+1;
DZ_DRAINAIGE_BOT=N_WOC_DIS+10;
WATER_REINJ_TOP=N_WOC_DIS+11+1+41;
DZ_REINJ_TOP=DZ_DRAINAIGE_BOT+1;
WATER_REINJ_BOT=N_WOC_DIS+11+1+41+1;
N_WOC_DIS = int2str(N_WOC_DIS);
WATER_DRAINAIGE_TOP=int2str(WATER_DRAINAIGE_TOP);
WATER_DRAINAIGE_BOT=int2str(WATER_DRAINAIGE_BOT);
WATER_REINJ_TOP=int2str(WATER_REINJ_TOP);
WATER_REINJ_BOT=int2str(WATER_REINJ_BOT);
DZ_DRAINAIGE_BOT=int2str(DZ_DRAINAIGE_BOT);
DZ_REINJ_TOP=int2str(DZ_REINJ_TOP);


if ii == 0 
   SCHEDULE_OUT(DZ_edit+45:DZ_edit+47)='   ';
   SCHEDULE_OUT(DZ_edit+45:DZ_edit+45+length('110')-1)='110';
   SCHEDULE_OUT(DZ_edit+82:DZ_edit+84)='   ';
   SCHEDULE_OUT(DZ_edit+82:DZ_edit+82+length('11')-1)='11';

else
SCHEDULE_OUT(DZ_edit+45:DZ_edit+47)='   ';
SCHEDULE_OUT(DZ_edit+45:DZ_edit+45+length(DZ_DRAINAIGE_BOT)-1)=DZ_DRAINAIGE_BOT;
SCHEDULE_OUT(DZ_edit+82:DZ_edit+84)='   ';
SCHEDULE_OUT(DZ_edit+82:DZ_edit+82+length(DZ_REINJ_TOP)-1)=DZ_REINJ_TOP;
end

SCHEDULE_OUT(DZ_edit+17:DZ_edit+18)='  ';
SCHEDULE_OUT(DZ_edit+17:DZ_edit+17+length('5')-1)='5';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+60)='  ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length('5')-1)='5';


SCHEDULE_OUT(WELL_edit+85:WELL_edit+86)='  ';
SCHEDULE_OUT(WELL_edit+85:WELL_edit+85+length(WATER_DRAINAIGE_TOP)-1)=WATER_DRAINAIGE_TOP;
SCHEDULE_OUT(WELL_edit+90:WELL_edit+91)='  ';
SCHEDULE_OUT(WELL_edit+90:WELL_edit+90+length(WATER_DRAINAIGE_BOT)-1)=WATER_DRAINAIGE_BOT;
SCHEDULE_OUT(WELL_edit+145:WELL_edit+146)='  ';
SCHEDULE_OUT(WELL_edit+145:WELL_edit+145+length(WATER_REINJ_TOP)-1)=WATER_REINJ_TOP;
SCHEDULE_OUT(WELL_edit+150:WELL_edit+151)='  ';
SCHEDULE_OUT(WELL_edit+150:WELL_edit+150+length(WATER_REINJ_BOT)-1)=WATER_REINJ_BOT;






fid=fopen('E:\Sajjad\DWL\Sensitivity\Distance from WOC\Data\150-R.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "E:\Sajjad\DWL\Sensitivity\Distance from WOC\Data\150-R.data"');
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