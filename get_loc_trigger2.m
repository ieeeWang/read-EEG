function TS = get_loc_trigger2(Digi)
% to regularize the raw trigger sinals (single pulse with different amplitudes)
% for the 2nd type of trigger signals (2nd participant)
% INPUT:
%     Digi - raw trigger signal with falling edges showing start of events
% OUTPUT:
%     TS - [loc, level], 'loc' is the location of triggers; 'level' is the 
% number of pulse in it.
% Lei@radboud uni. Feb23

%% make Digi into range of [0 n]
if min(Digi)~=0    
    Trigger = -1*(Digi - max(Digi)); %[0 8]
else
    Trigger = Digi; % after subj#20 (inluded 20)
end
% figure 
% plot(Trigger)

% find loc of rising edges: points where 0 is before it, and non-zero is after it
ts1= Trigger; % [1 or 0]
TS=[];
k=0;
for i=2:length(ts1)   
    if ts1(i-1)==0 && ts1(i)~=0 % a rising edge
        k=k+1;
        TS(k,1) = i;
        TS(k,2)= ts1(i);% value of the non-zero
    end
end


% remove 'trigger 1' in bigining of each 50 trails
if min(Digi)==0 % new trigger   
    TS([1,102],:)=[]; 
    disp('removed trigger');
end
