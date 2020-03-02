

/* 

natural(+Numero)

es cierto si Numero es natural

*/

natural(1).

natural(N):- N > 1, N2 is N-1, natural(N2).


