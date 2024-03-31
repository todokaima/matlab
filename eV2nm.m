%Thodoros Kaimasidis   
%15536
%2024
clc;
hc=1240.5; %Από τις σχέσεις των φυσικών μονάδων ξέρουμε ότι h-bar*c=197.3Mevfm
yes=true;
no=false;
g=true;

while g==true
     x = input('Πληκτρολογείστε 1 για μετατροπή από eV σε nm, 2 αλλιώς :');
    switch x
    case{1}
        E=input('Δώσε ενεργειακό χάσμα :');
        l=hc/E;
        fprintf('Το μήκοςκύματος ακρινοβολίας είναι: %f nm \n',l);
        prompt1='Συνεχίζουμε; [yes/no]\n ';
        g=input(prompt1);
    case{2}
        l=input('Δώσε μήκος κύματος :');
        E=hc/l;
        fprintf('Η ακτινοβολία αντιστοιχεί σε ενεργειακό χάσμα: %f eV \n',E);
        prompt2='Συνεχίζουμε; [yes/no]\n';
        g=input(prompt2);
    end
end
disp('Τέλος')


