clear;
%Thodoros Kaimasidis
%15536
%2024

linspace(0,8,7)
l=linspace(0,8,7) 
Values=[]; 

for i=l(:) %table
    Values=sind(i); %degrees
end

disp('Values='), disp(Values);
clear;

disp('---  Question 2  ---')

linspace(0,9,31) %Ο διαχωρισμός στο ματλαβ δουλεύει διαχωρίζοντας σε n-1 κομμάτια, οπότε φτιάχνω 30+1
l=linspace(0,9,31)
Values=[];

for i=l(:)
    Values=i.^3+3*i+5; %Διατρέχουμε το διάνυσμα με τις τιμές που διαλέξαμε-παράξαμε
end

disp('Values='), disp(Values);
clear;

disp('---   Question 3  ---')

tbl_1=rand(4) %Δημιουργία τυχαίου πίνακα με γραμμές * στήλες (default τετραγωνικός με ένα όρισμα)
tbl_1(:,2:3) %Επιλέγοντας την μονάδα "μνήμης" από το δεξί toolbar στην οθόνη του ματλαβ βλέπω τον tbl1 πίνακα και τον παραγώμενο του

tbl_2=rand(4,5) 
tbl_2([1,3],:) 

tbl_3=rand(4,5) 
tbl_3(:,2:4)

tbl_4=rand(4,5) 
tbl_4([2,4],:) 

tbl_5=rand(5,6) 
tbl_5([1,3,5],:) 




