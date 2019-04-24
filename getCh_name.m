function ch_name = getCh_name(description)
% extract the ch name from a structure named 'description'

n=0.5*length(description);
ch_name={};
for i=1:n
    temp=description(i*2-1);
    ch_name{i,1} = strrep((temp.SignalName)','(Lo) ',''); %newStr = strrep(str,old,new)
end
