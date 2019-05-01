clear all;
close all;
clc;

while (1==1)
    choice=menu('CBIR',...
                'SURF',...
                'Bag Of Features',...
                'Exit');
    if (choice ==1)
           SURF;
    end
    if (choice == 2)
        BOG;
    end   
    if (choice == 3)
        clear all;
        clc;
        close all;
        return;
    end    
end