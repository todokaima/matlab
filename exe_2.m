%Thodoros Kaimasidis
%15536
%2024
clc;

tic 
Na=[]; 
Nb=[]; 
N=[900, 12000, 120000];
for i=1:3 
    start=cputime; 
    n_1=N(i);    
    n_2=0; 
    for t=1:100000 
        P=n_1/N(i); 
        if rand()<P
           n_1 = n_1-1; 
           n_2 = n_2+1; 
           else
           n_1 = n_1+1;
           n_2 = n_2-1;
        end
     Na(t,i) = n_1; 
     Nb(t,i) = n_2;   
    end 
    time(i) = cputime - start; 

    disp('The final number of nanoparticles inside the part(a) and part(b) of the box are'), disp(n_1), disp(n_2), disp('with the initial number of N='), disp(N(i))
  
    t = 1:100000; 
    figure(i) 
    plot(t,Na(:,i),'LineWidth',1.0)
    hold on 
    plot(t,Nb(:,i),'LineWidth',1.0)
    xlabel('Time(s)')
    ylabel('Number of nanoparticles')
    xlim([0 10*10^4]) 
    n = N(i); 
    title(sprintf('The number of nanoparticles with Time (s) :\n ( N = %i ). Simulation time = %i s', n , time(i)))
    grid on
    hold on 
    Nth = (N(i)/2)*(1+exp(-2*t/N(i))); 
    plot(t,Nth,'LineWidth',1.0)
    plot(t,N(i)-Nth,'LineWidth',1.0)
    legend({'Nanoparticles in part(a)', 'Nanoparticles in part(b)', 'Theoretical Approximation of nanoparticles in part(a)','Theoretical Approximation of nanoparticles in part(b)' })
    hold off
end

%%%%%%%%%%%%%

disp('***** 2nd ex *****')

%prompt = 'Please type your name:'; 
%name = input(prompt,'s');
%prompt = 'Please input your surname:'; 
%surname = input(prompt,'s');
na=char('Thodoros');
s_1=double(na) 
s=char('Kaimasidis');
s_2=double(s); 
ON=sum(s_1); 
EP=sum(s_2); 

if ON>EP
    l=EP/ON; 
    disp(' N2 > N1')
else l=ON/EP;
    disp(' N1 > N2')
end

N1 = [];
N2 = [];
N=[900, 12000, 120000];
for i = 1:3 
    start2 = cputime;
    n_2 = N(i)/(1+l);
    n_1 = N(i)-n_2;
    
    for t = 1:100000 
        P = n_2/N(i);  
        if rand()<P 
            n_1 = n_1+1;
            n_2 = n_2-1;
        else
            n_1 = n_1-1;
            n_2 = n_2+1;
        end
        N1(t,i) = n_1; 
        N2(t,i) = n_2; 
    end
    time2(i) = cputime - start2;
    disp('The final number of nanoparticles inside the part(a) and part(b) of the box are'), disp(n_1), disp(n_2), disp('with the initial number of N='), disp(N(i))
   
    t = 1:100000;
    figure(i+3);
    plot(t,N1(:,i),'LineWidth',1.0)
    hold on
    plot(t,N2(:,i),'LineWidth',1.0)
    xlabel('Time(s)')
    ylabel('Number of nanoparticles')
    xlim([0 10*10^4])
    n = N(i);
    title(sprintf('The number of nanoparticles with Time (s) :\n ( N = %i ). Simulation time = %i s', n , time2(i)))
    grid on
    hold on
    N_th = (N(i)/2)*(1+exp(-2*t/N(i))); 
    plot(t,N(i)-N_th,'LineWidth',1.0)
    plot(t,N_th,'LineWidth',1.0)
    legend({'Nanoparticles in part(a)', 'Nanoparticles in part(b)', 'Theoretical Approximation of nanoparticles in part(a)','Theoretical Approximation of nanoparticles in part(b)' })
    hold off
end

for i = 1:3
    figure(i+6)
    plot(t,Na(:,i),'LineWidth',1.0)
    hold on
    plot(t,Nb(:,i),'LineWidth',1.0)
    hold on
    plot(t,N1(:,i),'LineWidth',1.0)
    hold on
    plot(t,N2(:,i),'LineWidth',1.0)
    xlabel('Time(s)')
    ylabel('Number of nanoparticles')
    xlim([0 10*10^4])
    n = N(i);
    title(sprintf('The number of nanoparticles with Time (s) for both cases :\n ( N = %i )', n))
    grid on
    hold on
    Nth = (N(i)/2)*(1+exp(-2*t/N(i))); 
    plot(t,Nth,'LineWidth',1.5)
    plot(t,N(i)-Nth,'LineWidth',1.5)
    legend({'Nano. in a (case 1)', 'Nano. in b (case 1)', 'Nano. in a (case 2)', 'Nano. in b (case 2)','Theoretical Approx of nano. in a (case 1) and in b (case 2)','Theoretical Approx. of nano. in b (case 1) and in a (case 2)' })
    hold off
end  
time_3 = toc; 
fprintf('The whole simulation runs in t = %d s\n',time_3)