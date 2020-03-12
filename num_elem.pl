/*

num_elem(?Lista, ?Num)
  es cierto si Num unifica con el 
  número de elementos de la lista Lista
  
*/

num_elem([], 0).

num_elem([_|Resto], R2 ):-
  num_elem(Resto, R),
  R2 is R+1.
