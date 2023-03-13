% Family tree
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat,jim).
female(ann).
female(liz).
female(pat).
male(bob).
male(tom).
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X).
aunt(Z,Y):- parent(X,Y), male(X), sister(Z,X).

% Printing numbers from M to 1
yazdir(M):- not(M=0), write(M), write('  '), K is M-1, yazdir(K).
% Printing X times the character h
hyaz(X):- not(X=0), Y is X-1, put(104), hyaz(Y).

% What is his illness?
bloodPressure(ahmet,12).
bloodPressure(mehmet,15).
bloodPressure(hilmi,16).
bloodPressure(mazhar,18).
fever(ahmet,34).
fever(mehmet,35).
fever(hilmi,39).
fever(mazhar,40).
hasNausea(ahmet).
hasNausea(mehmet).
hasNausea(mazhar).
hasDizziness(hilmi).
hasDizziness(mazhar).

highBloodPressure(X):-bloodPressure(X,K),K>13.
highFever(X):-fever(X,K),K>37.
x_patient(X):-highFever(X),hasNausea(X).
y_patient(X):-highBloodPressure(X),x_patient(X).
z_patient(X):-hasNausea(X),y_patient(X).

% Path Exists
connected(1,4).
connected(1,3).
connected(4,2).
connected(2,3).
connected(3,5).
connected(4,6).
connected(6,1).
path(X,Y):-connected(X,Y),!.
path(X,Y):-connected(X,Z), write(X), path(Z,Y).