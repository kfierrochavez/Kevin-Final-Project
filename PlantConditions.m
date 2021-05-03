function [] = PlantConditions
%comments describe code below it
%Closes all open figures
close all;

% Variable that is shared between all functions
global plant;

%plant.fig creates the figure on which all the components of the GUI will be on
plant.fig = figure('numbertitle','off','name','Is it a good time to plant your tree?');

%This is a text box UI element. Gives the user some instructions (1/3)
plant.directions = uicontrol('style','text','units','normalize','position',...
    [0.006 0.904 0.9845 0.0468],'string','Please Select The Time Of Year And Your Trees Hardiness Below');

%Step 1 text box
plant.month = uicontrol('style','text','units','normalized','position',[0.006 .801 .9845 .0468],'string','Step 1 : Month');

%List of months text box
plant.listMonth = uicontrol('style','text','units','normalized','position',[0.006 .7 .9845 .0468],'string',...
    'Jan   Feb   Mar   Apr   May   June   July   Aug   Sep   Oct   Nov   Dec');

%Step 2 text box
plant.zone = uicontrol('style','text','units','normalized','position',[0.006 .533 .9845 .0468],'string','Step 2 : Zones');

%Creates the scroll bar/slider UI element (2/3). Includes callback (1/2)
plant.scrollbar = uicontrol('style','slider','units','normalized','position',[.1988 .7683 .6 .05],...
    'value',1,'min',1,'max',12,'sliderstep',[1/11 1/11],'callback',{@scrollbar});

%UI element that creates the box that will hold all the radio buttons
%(3/3). Includes callback (2/2)
plant.buttonGroup = uibuttongroup('visible','on','unit','normalize','position',...
    [.369 .1 0.2655 0.45],'selectionchangefcn',{@radioSelect});

%Lines 36-73 are all radio buttons
plant.r1 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .8961 .3823 .0791],'HandleVisibility','off','string','1');

plant.r2 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .7461 .3823 .0791],'HandleVisibility','off','string','2');

plant.r3 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .5961 .3823 .0791],'HandleVisibility','off','string','3');

plant.r4 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .4461 .3823 .0791],'HandleVisibility','off','string','4');

plant.r5 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .2961 .3823 .0791],'HandleVisibility','off','string','5');

plant.r6 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.0356 .1461 .3823 .0791],'HandleVisibility','off','string','6');

plant.r7 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.3046 .0243 .3823 .0791],'HandleVisibility','off','string','7');

plant.r8 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .8961 .3823 .0791],'HandleVisibility','off','string','8');

plant.r9 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .7461 .3823 .0791],'HandleVisibility','off','string','9');

plant.r10 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .5961 .42 .0791],'HandleVisibility','off','string','10');

plant.r11 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .4461 .42 .0791],'HandleVisibility','off','string','11');

plant.r12 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .2961 .42 .0791],'HandleVisibility','off','string','12');

plant.r13 = uicontrol(plant.buttonGroup,'style','radiobutton','units','normalized','position',...
    [.55 .1461 .42 .0791],'HandleVisibility','off','string','13');
end

function [] = radioSelect(~,~)
    global plant;
    
    %Sets i equal to the string associated with the button that was pushed
    i = plant.buttonGroup.SelectedObject.String;
    
    %Turns the string from line 80 into a number
    i = str2double(i);
    
    %Loop that decides if the tree is of the correct hardiness level
    if i <= 4 || i >=7
        %message box that says the tree is not the correct hardiness level
        msgbox({'Seems like your trees hardiness level isnt';'ideal for Lincoln.';'';'TIP: Nebraska is Zone 5 - 6'});
    else
        %message box that says the tree is the correct hardiness level
        msgbox({'Awesome!';'Your tree has the correct hardiness level';'for this area.';'Go ahead and plant your tree!'});
    end
    
end

function [] = scrollbar(~,~)
    global plant;
    
    %Rounds the scrollbar value so that I get an intger and not a fraction
    plant.scrollbar.Value = round(plant.scrollbar.Value);
    
    %Sets i equal to the rounded scrollbar value
    i = plant.scrollbar.Value;
    
    %Loop that decides if it's the right time to plant a tree
    if i <= 3 || i >= 7
        %message box that says it is not the right time to plant
        msgbox({'Seems like its not the ideal time to plant :(';'';'TIP: Try sometime between mid-spring and early summer'});    
    else
        %message box that says it is the right time to plant
        msgbox({'Splendid!';'Looks like its a good time to plant.';'Move on to the next check :)'});
    end
end

