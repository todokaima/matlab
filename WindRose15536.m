% Thodoros Kaimasidis - 15536
% Wind rose
% CP 2023 - 2024

clear;
filename = ['Wind_data.xlsx'];
Data = xlsread(filename);

year = Data(:,1); 
month = Data(:,2); 

year_min = min(year);
year_max = max(year);

year1 = year_min +(year_max-year_min-5)*rand %τυχαίο έτος ανάμεσα στην πρώτη και 5 χρόνια από την τελευταία χρονιά

data2 = [];
l = 1;
for i = 1:length(year)
    if year(i) <= year1 && year(i) >= year1-5 && (month(i)>=9 && month(i)<=11)
        data2(l,:) = Data(i,:);
        l = l + 1;
    end
end

Data = data2;
year = Data(:,1);
month = Data(:,2);
day = Data(:,3);
time = Data(:,4)+2; %UST -> LST
wind_speed = Data(:,5)*0.51;  %KNOTS -> M/S
wind_direction = Data(:,6);

intervals = wind_direction/22.5; % normalizes wind direction values between 0 and 16
intervals = ceil(intervals); %rounds each number to the nearest integer greater than or equal to that number
mf_direction = mode(intervals)*22.5; % most frequent direction

options = {'anglenorth',0,'angleeast',90,'freqlabelangle',30,'ndirections',16,'labels',{'N (0°)','E (90°)','S (180°)','W (270°)'}};
[figure_handle, count, speeds, directions, Table] = WindRose(wind_direction,wind_speed,options);

hold on

title(sprintf('Autumn, Time period %d - %d\n',year1-5,year1))
computer_name = getenv('COMPUTERNAME');

annotation('textbox',[0.65 .05 0 .065],'String',computer_name,'FitBoxToText','on');

annotation('textbox',[0.65 0 .065 .065],'String','Theodoros Kaimasidis','FitBoxToText','on');

annotation('textbox',[0.20 0 .065 .065],'String','15-Jan-2024','FitBoxToText','on');

str = sprintf('Most frequent wind direction: %.2f - %.2f degrees',(mf_direction-22.5),mf_direction);

text(0.25, 0.2, str,'FontWeight','bold','Units','normalized')


