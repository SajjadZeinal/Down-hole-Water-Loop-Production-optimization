attempt=1;
Results=zeros(1500,100);
for Qw=500:500:10000
QW=int2str(Qw);
fid=fopen('E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.data','r');
SCHEDULE_OUT=fread(fid);
fclose(fid);
SCHEDULE_OUT=char(SCHEDULE_OUT.');
edit_point=strfind(SCHEDULE_OUT,'limit');
SCHEDULE_OUT(edit_point+120:edit_point+124)='     ';
SCHEDULE_OUT(edit_point+118:edit_point+118+length(QW)-1)=QW;
fid=fopen('E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.data','w');
fwrite(fid,SCHEDULE_OUT);
fclose(fid);
system('"C:\ecl\macros\eclrun.exe" eclipse "E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.data"');
[NPV,totNPV,QOP,QWp,days,QOP_Water_Drainage,QOPT_WATER_DRAINAGE]=cal_NPV_Well_DWL;
Results(1:length(days),attempt)=days;
Results(1:length(QOP),attempt+1)=QOP;
Results(1:length(QWp),attempt+2)=QWp;
Results(1:length(NPV),attempt+3)=NPV;
Results(1:length(NPV),attempt+4)=totNPV;
Results(1:length(NPV),attempt+5)=Qw;
Results(1:length(NPV),attempt+6)=QOPT_WATER_DRAINAGE;
attempt=attempt+7;
end
