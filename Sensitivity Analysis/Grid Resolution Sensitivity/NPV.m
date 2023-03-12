system('"C:\ecl\macros\eclrun.exe" eclipse "H:\Univercity documents\master\Project\Work over\DWL\Simulation\Well DWL\Comparison\DWL\Wojtanovic.data"');
attempt=1;
[NPV,totNPV,QOP,QWp,days,QOP_Water_Drainage,QOPT_Water_Drainage]=cal_NPV_Well_DWL;
Results(1:length(days),attempt)=days;
Results(1:length(QOP),attempt+1)=QOP;
Results(1:length(QWp),attempt+2)=QWp;
Results(1:length(NPV),attempt+3)=NPV;
Results(1:length(NPV),attempt+4)=totNPV;
Results(1:length(NPV),attempt+5)=QOPT_Water_Drainage;