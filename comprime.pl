
/* 
   comprime(+Lista, -R)
   es cierto si R unifica con una lista
   de la siguiente forma:
  
   comprime([1,1,1,2,2,2,3,4,4], R).
   R=[(1,3), (2,3), (3,1), (4,2)]   
	
   Aplicamos inducción matemática
   
   [1,1,2,2,2,3,4,4]
   R=[(1,2), (2,3), (3,1), (4,2)]
   
   
   [1,2,2,2,3,4,4]
   R=[(1,1),(2,3), (3,1),(4,2)]
   
   [2,2,2,3,4,4]
   R=[(2,3),(3,1), (4,2)]
*/

comprime([], []).

comprime([E], [(E,1)]).

comprime([C,C|Resto], [(C,N2)|R] ):-
  comprime([C|Resto], [(C,N)|R]),
  N2 is N+1.
  
comprime([C1, C2|Resto], [(C1,1)|R]):-
   C1 \= C2,
   comprime([C2|Resto], R).
