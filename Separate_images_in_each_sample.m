clear all
cd 'C:\Users\lfang\Desktop\Stats\New data\Sample5 Cluster_analysis_for_red_Statistics'
folder='C:\Users\lfang\Desktop\Stats\New data\Sample5 Cluster_analysis_for_red_Statistics';
Dir=dir(folder);
nameList={Dir.name};
nameList=nameList(~cellfun(@isempty,regexp(nameList,'.+(?=\.csv)','match')));
for k=1:numel(nameList)-1
    In=xlsread(nameList{k}); 
    Out = zeros(max(In(:,8))+1,mode(In(:,8)));
    count = 1;
    Out(1,1) = In(1,1);
    for i=2:length(In)
        idx = In(i,8)+1; %start from 0;
        if In(i-1,8) == In(i,8)
            count = count + 1;
        else
            count = 1;
        end
        Out(idx,count) = In(i,1);
    end
    [~, baseFileName, ~] = fileparts(nameList{k});
    xlswrite(strcat(string(baseFileName),'_reorganized'), Out');
end

In=xlsread(nameList{numel(nameList)}); 
Out = zeros(max(In(:,6))+1,mode(In(:,6)));
count = 1;
Out(1,1) = In(1,1);
for i=2:length(In)
    idx = In(i,6)+1; %start from 0;
    if In(i-1,6) == In(i,6)
        count = count + 1;
    else
        count = 1;
    end
    Out(idx,count) = In(i,1);
end
[~, baseFileName, ~] = fileparts(nameList{numel(nameList)});
xlswrite(strcat(string(baseFileName),'_reorganized'), Out');


