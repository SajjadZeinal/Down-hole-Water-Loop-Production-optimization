function rates = dataimport_WELL_DWL
fileID=fopen('E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.PRT');
A3=fscanf(fileID,'%c');
Problems=strfind(A3,'Problems');
N_Problems = Problems+21;
Number_of_Problems=A3(N_Problems:N_Problems+3);
Number_of_Problems_int=str2num(Number_of_Problems);
fileID=fopen('E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.FUNSMRY');
A2=fscanf(fileID,'%c');
tsteps=strfind(A2,'REAL');
if Number_of_Problems_int == 101
startinteger_in_FUNSMRY1 = tsteps + 9;
startinteger_in_FUNSMRY2 = tsteps + 80;
for ii=1:length(startinteger_in_FUNSMRY1)
n2(ii,:)=A2(startinteger_in_FUNSMRY1(1,ii):startinteger_in_FUNSMRY1(1,ii)+65);
n3(ii,:)=A2(startinteger_in_FUNSMRY2(1,ii):startinteger_in_FUNSMRY2(1,ii)+49);
end
rates2_1=str2num(n2);
rates2_2=str2num(n3);
rates=[rates2_1 rates2_2];
else
fileID=fopen('E:\Sajjad\DWL\Sensitivity\QWD\Data file\150-R.RSM');
A=fscanf(fileID,'%c');
startpoint=strfind(A,'WWPR');
startinteger=startpoint+451;
n=A(startinteger:startinteger+length(tsteps)*134);
rates=str2num(n);
end
fclose all;
end
