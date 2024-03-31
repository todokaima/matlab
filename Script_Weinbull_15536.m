
%Thodoros Kaimasidis
%15536
%2024

clear;
AEM = 15536;
filename = 'Weibull_data.xlsx';
if mod(AEM,2) == 0 
    Data = xlsread(filename,'station_1');
else
    Data = xlsread(filename,'station_2');
end

year = Data(:,1);
month = Data(:,2);
day = Data(:,3);
hour = Data(:,4);
if mod(AEM,2) == 0
    wind_speed = Data(:,6);
    wind_direction = Data(:,5);
else
    wind_speed = Data(:,5);
    wind_direction = Data(:,6);
end

wind_speed = wind_speed*0.51; % conversion to m/s

year_min = min(year);
year_max = max(year);

year1 = randi([year_min,year_max-4]); % random year selection

v = [];
c = 1;
for i = 1:length(year)
    if year(i) >= year1 && year(i) <= year1+4
        v(c,:) = wind_speed(i,:);
        c = c + 1;
    end
end

v(v==0) = [];  
v = round(v);
v2 = min(v):max(v);

for i=1:length(v2)
    occurances = v(v==v2(i));  
    occ_matrix(i) = length(occurances);  
end

total_measurements = sum(occ_matrix);  

for i=1:length(v2)
    prob(i) = occ_matrix(i)/total_measurements;
end

freq = 0;
for i=1:length(v2)
    freq = prob(i) + freq;
    F(i) = freq; 
end
F(end)=round(F(end)); 

figure;
bar(v2,prob)
hold on
xticks(v2);
xlabel('Wind speed [m/s]');
ylabel('Probability');

X = log(v2);
Y = log(-log(1-F));

for i=1:length(v2)
    if isinf(Y(i)) || ~isreal(Y(i))
        X(i)= [];
        Y(i)= [];
    end
end


meanX = mean(X);
meanY = mean(Y);
for i = 1:length(X)
    d_1 = X(i)-meanX;
    d_2 = Y(i)-meanY;
    num(i) = d_1*d_2;
    d_3 = (X(i)-meanX)^2;
    den(i) = d_3;
end
num = sum(num);
den = sum(den);
B = num/den;
A = meanY - B*meanX;

C = exp(-A/B);
k = B;

f_V = k/C*(v2/C).^(k-1).*exp(-((v2/C).^k)); % computing weibull curve
plot(v2,f_V,'LineWidth',2)

coeffs = sprintf('c = %.3f\n k = %.3f',C,k);
computer_name = getenv('COMPUTERNAME');

title(sprintf('Wind speed distribution for time period %d - %d\n Number of measured data: %d',year1,year1+3,total_measurements))
annotation('textbox',[0.005 0 .060 .060],'String',computer_name,'FitBoxToText','on');
annotation('textbox',[0.01 0.05 .060 .060],'String','Theodoros Kaimasidis','FitBoxToText','on');
annotation('textbox',[0.8 0.8 .060 .060],'String',coeffs,'FitBoxToText','on');
