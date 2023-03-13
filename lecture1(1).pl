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

pred1(X, Z) :- parent(X, Z).
pred1(X, Z) :- parent(X, Y), pred1( Y, Z).
pred2(X, Z) :- parent(X, Y), pred2( Y, Z).
pred2(X, Z) :- parent(X, Z).
pred3(X, Z) :- parent(X, Z).		
pred3(X, Z) :- pred3( X, Y), parent(Y, Z).
pred4(X, Z) :- pred4( X, Y), parent(Y, Z).
pred4(X, Z) :- parent(X, Z).	

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

includes(room,home).
includes(class,school).
exists(reads,ali,book,class,12).
exists2(go,M,_,Place,_):-exists(_,M,_,Place,_).
exists2(F,M,B,Place1,I):-includes(Place2,Place1),exists2(F,M,B,Place2,I).
exists2(has,ali,lunch,kitchen,_):-exists2(go,ali,_,home,_).
exists2(has,ali,lunch,canteen,_):-exists2(go,ali,_,school,_).

% Find size of a list
size([],0).
size([_|T],N) :- size(T,N1), N is N1+1.
% size([_|T],N) :- N is N1+1, size(T,N1).

member(Element,[Element| _ ] ).
member(Element,[ _ |Tail] ) :- member(Element,Tail).
member(Element,[ Head|_] ) :- member(Element,Head).

addonetolist([],[]).
addonetolist([H1|T1],[H2|T2]):-H2 is H1+1,addonetolist(T1,T2).

del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]):-del(X,Tail,Tail1).

writelist([]):-nl.
writelist([H|T]):-write(H),write(' '), writelist(T).

classlist(ahmet,bollu,23).
classlist(mhmet,bollu,38). 
classlist(zhmet,bollu,53). 
classlist(shmet,bollu,63).
classlist(chmet,bollu,73).
classlist(qhmet,bollu,83). 
   
findnote(G,L):-G>80,L='A',!.
findnote(G,L):-G>70,L='B',!.
findnote(G,L):-G>50,L='C',!.
findnote(G,L):-G>30,L='D',!.
findnote(G,L):-G>10,L='E',!.

class:- writelist([class,list]),
        classlist(N,S,G),
        findnote(G,L),
        writelist([N,S,G,L]).