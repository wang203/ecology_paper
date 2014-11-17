%      52 10750 -- no gt
%      88 9998
%      94 8742
%    2822 10025
%    4368 10255 -- no gt
%    4878 9392


% 52 10750 67 30 
% 88 9998 62 78
% 94 8742 54 102
% 2822 10025 62 105
% 4368 10255 64 15
% 4878 9392 58 112

file=dlmread('daybin2007bar'); 

for i=1:6
    list = zeros(23,7);%day bin predi gt prediposi prenega gtposi gtnega
    list(:,1:3) = file((i-1)*23+1:23*i,3:5);
    %list2 = file((i-1)*23+1:23*i,4);
    val = list(:,3);
    val = val-min(val);
    normval = val/norm(val,1)*5;
    for j = 1:23
        if list(j,1)==1 %gt
            list(j,4) = -1;
            list(j,5) = 0;
        else if list(j,1) == -1
                list(j,4) = 0;
                list(j,5) = -1;
            end
        end
        if list(j,2)==1 %prediction
            list(j,6) = normval(j);
            list(j,7) = 0;
        else if list(j,2) == -1
                list(j,6) = 0;
                list(j,7) = normval(j);
            end
        end
    end

    subplot(2,3,i);
    bar(1:23,list(:,4),'b');
    hold on
    bar(list(:,6),'b');
    bar(list(:,5),'y');
    bar(list(:,7),'y');
end