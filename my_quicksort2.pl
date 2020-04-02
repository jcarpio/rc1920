

/*
  my_quicksort(Lista, R)
  es cierto si R unifica con una lista
  que contiene los elementos de Lista  
  ordenados de menor a mayor por el método
  de quicksort
  
  O(n log n)

  [9,4,6,2,6,3,1,4,2]
      pivote=4 -> O(n) 
  Menores o iguales		 Mayores
  [4,2,3,1,4,2]          [9,6,6]

  quicksort([4,2,3,1,4,2], R1)
  quicksort([9,6,6], R2)
  
  R1=[1,2,2,3,4,4]
  R2=[6,6,9]
  
  R=[1,2,2,3,4,4,6,6,9] 
  
*/
my_quicksort2([], []).
my_quicksort2([Cab|Resto], R):-
  divide(Resto, Cab, Men, May),
  my_quicksort2(Men, Rme),
  my_quicksort2(May, Rma),
  append(Rme, [Cab|Rma], R).
  
/* menores_o_iguales(Lista, P, R)
  es cierto si R unifica con la lista
  de valores de Lista que son menores o 
  iguales que P.
*/

divide([], _, [], []).

divide([Head|Tail], P, [Head|L], H):- divide(Tail, P, L, H),
   Head =< P.
   
divide([Head|Tail], P, L, [Head|H]):- divide(Tail, P, L, H),
   Head > P.
  
