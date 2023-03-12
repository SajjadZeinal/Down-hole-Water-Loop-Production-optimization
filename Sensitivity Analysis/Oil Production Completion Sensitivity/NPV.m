%X3=UPPER point of oil completion
%X4=lower point of oil completion
attempt=1;
for ii=5:5:50
x3=15000;
x4=x3+ii;
[ TOTAL_NUMBER_VERT_BLOCK , OIL_PERF , N_OIL_BLOCK , LOWER_OIL , N_LOWER_OIL  ]=DZ_EDIT(x4,x3);
fid=fopen('E:\Sajjad\DWL\Sensitivity\Oil Production Completion\Data\150-R.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
DIMENS_edit=strfind(SCHEDULE_OUT,'DIMENS');
DZ_edit=strfind(SCHEDULE_OUT,'DZLENGTH');
WELL_edit=strfind(SCHEDULE_OUT,'edit');
COORD=strfind(SCHEDULE_OUT,'COORDSYS');
MULTPV=strfind(SCHEDULE_OUT,'MULTPV');
SCHEDULE_OUT(DIMENS_edit+18:DIMENS_edit+20)='   ';
SCHEDULE_OUT(DIMENS_edit+18:DIMENS_edit+18+length(TOTAL_NUMBER_VERT_BLOCK)-1)=TOTAL_NUMBER_VERT_BLOCK;
SCHEDULE_OUT(COORD+22:COORD+24)='   ';
SCHEDULE_OUT(COORD+22:COORD+22+length(TOTAL_NUMBER_VERT_BLOCK)-1)=TOTAL_NUMBER_VERT_BLOCK;
SCHEDULE_OUT(DZ_edit+19:DZ_edit+22)='    ';
SCHEDULE_OUT(DZ_edit+19:DZ_edit+19+length(OIL_PERF)-1)=OIL_PERF;
SCHEDULE_OUT(DZ_edit+43:DZ_edit+45)='   ';
SCHEDULE_OUT(DZ_edit+43:DZ_edit+43+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
SCHEDULE_OUT(WELL_edit+26:WELL_edit+28)='   ';
SCHEDULE_OUT(WELL_edit+26:WELL_edit+26+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
if x4 == 15050
SCHEDULE_OUT(DZ_edit+80:DZ_edit+82)='   ';
SCHEDULE_OUT(DZ_edit+80:DZ_edit+80+length('1')-1)='1';
SCHEDULE_OUT(DZ_edit+84:DZ_edit+86)='   ';
SCHEDULE_OUT(DZ_edit+84:DZ_edit+84+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
SCHEDULE_OUT(DZ_edit+59:DZ_edit+62)='    ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length(OIL_PERF)-1)=OIL_PERF;
SCHEDULE_OUT(MULTPV+30:MULTPV+32)='   ';
SCHEDULE_OUT(MULTPV+30:MULTPV+30+length(N_OIL_BLOCK)-1)=N_OIL_BLOCK;
else
SCHEDULE_OUT(DZ_edit+84:DZ_edit+86)='   ';
SCHEDULE_OUT(DZ_edit+84:DZ_edit+84+length(N_LOWER_OIL)-1)=N_LOWER_OIL;
SCHEDULE_OUT(MULTPV+30:MULTPV+32)='   ';
SCHEDULE_OUT(MULTPV+30:MULTPV+30+length(N_LOWER_OIL)-1)=N_LOWER_OIL;
SCHEDULE_OUT(DZ_edit+59:DZ_edit+62)='    ';
SCHEDULE_OUT(DZ_edit+59:DZ_edit+59+length(LOWER_OIL)-1)=LOWER_OIL;
N_OIL_BLOCK_int=str2num(N_OIL_BLOCK);
N_OIL=int2str(N_OIL_BLOCK_int+1);
SCHEDULE_OUT(DZ_edit+80:DZ_edit+82)='   ';
SCHEDULE_OUT(DZ_edit+80:DZ_edit+80+length(N_OIL)-1)=N_OIL;   
end

fid=fopen('E:\Sajjad\DWL\Sensitivity\Oil Production Completion\Data\150-R.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "E:\Sajjad\DWL\Sensitivity\Oil Production Completion\Data\150-R.data"');
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