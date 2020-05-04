
/* 
   elimina_cada_n(+Lista, +N, -R)
   es cierto si R unifica con una lista
   que contiene los elementos de Lista
   eliminando los valores que ocupan
   posiciones que son múltiplos de N.
   
   elimina_cada_n([1,2,3,4,5,6,7,8,9], 3, R)
      
   R=[1,2,4,5,7,8]
   
   elimina_cada_n([4,7,2,9,4,1,5,6], 3, R)
   R=[4,7,2,9,4,5,6]

   Inducción
   
   Extensión de la inducción, dónde no quito un elemento
   sino que quito trozos de tamaño N.
*/

elimina_cada_n(Lista, N, Lista):-
 length(Lista, L), L < N.

elimina_cada_n(Lista, N, R2):-
  length(Lista, L), L >= N,
  N2 is N - 1,
  length(L1, N2),
  append(L1, [_|L2], Lista),
  elimina_cada_n(L2, N, R),
  append(L1, R, R2).
