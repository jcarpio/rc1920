

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

my_quicksort([],[]).

my_quicksort([Cab|Resto], R):-
  menores_o_iguales(Resto, Cab, Men),
  mayores(Resto, Cab, May),
  my_quicksort(Men, Rme),
  my_quicksort(May, Rma),
  append(Rme, [Cab|Rma], R).
  
/* menores_o_iguales(Lista, P, R)
  es cierto si R unifica con la lista
  de valores de Lista que son menores o 
  iguales que P.
*/
menores_o_iguales([],_,[]).

menores_o_iguales([Cab|Resto],P , [Cab|R]):-  
  Cab =< P, menores_o_iguales(Resto,P, R).

menores_o_iguales([Cab|Resto], P, R):-  
  Cab > P, menores_o_iguales(Resto,P, R).

/* mayores(Lista, P, R)
  es cierto si R unifica con la lista
  de valores de Lista que son mayores 
  que P.
*/
mayores([],_,[]).

mayores([Cab|Resto], P, [Cab|R]):-
  Cab > P, mayores(Resto,P,R).
  
mayores([Cab|Resto], P, R):-
  Cab =< P, mayores(Resto,P,R).
