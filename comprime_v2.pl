
/* 
   comprime(+Lista, -R)
   es cierto si R unifica con una lista
   de la siguiente forma:
  
   comprime([1,2,2,2,3,4,4], R).
   R=[1, (2,3), (3,1), (4,2)]   
	
   Aplicamos inducción matemática
   
*/

comprime([], []).

comprime([E], [E]).

comprime([C,C|Resto], [(C,2)|R] ):-
  comprime([C|Resto], [C|R]).
  
comprime([C,C|Resto], [(C,N2)|R] ):-
  comprime([C|Resto], [(C,N)|R]),
  N2 is N + 1.

comprime([C1, C2|Resto], [C1|R]):-
   C1 \= C2,
   comprime([C2|Resto], R).
