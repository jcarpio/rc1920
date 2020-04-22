:- use_module(library(clpfd)).

bytes_integer(Bs, N) :-
        foldl(pow, Bs, 0-0, N-_).

pow(B, N0-I0, N-I) :-
        B in 0..255,
        N #= N0 + B*256^I0,
        I #= I0 + 1.
		
		
suma(N1, 0, N1).		
suma(N1, N2, R2):- N2 #>= 0, N22 #= N2 - 1, suma(N1, N22, R),
    R2 #= R - 1.
	
suma2(N1, N2, R) :- R #= N1 + N2.
