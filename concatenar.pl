/*
concatenar(?L1, ?L2, ?R)
es cierto si R unifica con una lista
que contiene los elementos de L1 seguidos
de los elementos de L2 en el mismo orden.
*/

% P(n-1) -> P(n)
% P(N) :- N2 is N-1, P(N2).

concatenar([], L2, L2).
concatenar([Cab|Resto], L2, [Cab|R]):-
   concatenar(Resto, L2, R).
   
/*
1. Tengo un caso para n0. ¿Este caso es cierto?
2. ¿Tengo todos los casos cubiertos?
   ¿Tengo casos repetidos?



concatenar(_,[E1,E2|_], [1,2,3,4,5,6,7]).

E1=1
E2=2;
E1=2
E2=3;
E1=3
E2=4;

*/
