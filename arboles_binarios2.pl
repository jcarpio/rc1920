
/*
  Arboles Binarios
   
  nil
  a(Etiqueta, HijoIzquierda, HijoDerecha)
  
      1
     / \
    2   3	  


       1
	  / \  
     /   \
    2     3	  
   / \   / \
  4   5 6   7
  
  
       +
	  / \  
     /   \
    *     /	  
   / \   / \
  4   5 6   7
*/ 
   
arbol1( a(1, a(2, nil, nil), a(3, nil, nil)) ).
arbol2(a(1, a(2, a(4,nil,nil), a(5,nil,nil)), a(3, a(6,nil,nil),a(7,nil,nil)))).
arbol3(a('+', a('*', a(4,nil,nil), a(5,nil,nil)), a('/', a(6,nil,nil),a(7,nil,nil)))).

/*
preorden(Arbol, Lista)
 es cierto si Lista unifica con el recorrido 
 en preorden de Arbol.
 
 raiz, hi, hd

*/
preorden(nil, []).


% posorden
% hi, hd, raiz

% inorden
% hi, raiz, hd

/*
pertenece(-E, +Arbol).
  es cierto si la etiqueta E pertenece al
  árbol binario Arbol.
*/

pertenece(E, a(E, _, _)).

% a -> b v c
% a -> b
% a -> c

pertenece(E, a(Et, HI, _)):-
  E \= Et,
  pertenece(E, HI).

pertenece(E, a(Et, _, HD)):-
  E \= Et,
  pertenece(E, HD).
  
  
/* 

  hojas(Arbol, Lista)
  es cierto si Lista unifica con 
  una lista que contiene todas las hojas
  del árbol
*/

% Tengo que tener en cuenta todas las opciones

% 1. los dos nulos 
% 2. dos árboles no nulos
% 3. HI nulo derecha no nulo
% 4. HD nulo izquierda no nulo

% A B
% 0 0
% 0 1
% 1 0
% 1 1


  hojas(nil, []).

  hojas(a(E, nil, nil), [E]).
  
  hojas(a(_, nil, HD), RD):-
    HD \= nil,
	hojas(HD, RD).
	
  hojas(a(_, HI, nil), RI):-
    HI \= nil,
	hojas(HI, RI).
	
  hojas(a(_, HI, HD), R):-
    HI \= nil, HD \= nil,
    hojas(HI, RI),
    hojas(HD, RD),	
	append(RI, RD, R).
	
/*
	
% O(n)     -> lineal
% O(log n) -> logarítmico
% O(n^2)   -> cuadrático

id_user id_video

1   1
1   2
1   3
2   2
2   3
3   1    

¿Qué vídeo de YouTube fue el más visitado
el mes pasado? Para ordenar tengo un algoritmo
cuadrático.

Quiero tener la respuesta antes de mañana a las 9

4.500.000 cada minuto 
visualizaciones de vídeos en YouTube al día

Procesador i7 5500U 2.4 Ghz

*/

/*
buscar_abb(E, ABB)
 es cierto si el elemento E pertenece al 
 árbol binario de búsqueda ABB
*/

buscar_abb(E, a(E, _, _)).

buscar_abb(E, a(Raiz, HI, _)):-
  E < Raiz,
  buscar_abb(E, HI).

buscar_abb(E, a(Raiz, _, HD)):-
  E > Raiz,
  buscar_abb(E, HD).

/*
       9
	  / \
     5   12
	/ \  / \ 
   3   7 10 15

*/

arbol4(a(9, a(5, a(3,nil,nil), a(7,nil,nil)), a(12, a(10,nil,nil), a(15,nil,nil)))).


/* crea_arbol(+Lista, +Arbol)
   es cierto si Arbol unifica con un árbol
   binario que contiene los elementos 
   de Lista
*/

crea_arbol([], nil).
crea_arbol([Cabeza|Resto], a(Cabeza, R, nil) ):-
  crea_arbol(Resto, R).
  
/*
    crea_arbol([1,2,3,4,5], R).
   
        1
       /	   
      2
	 /
    3
   /
  4
 / 
5 

*/

/*
 balanceado(+Arbol)
  es cierto si Arbol es un árbol binario 
  balanceado. Para todo nodo, la diferencia
  entre la altura del árbol derecho y el 
  árbol izquierdo es como máximo 1.
   
      1
	 / \
    2   3
   /
  4
 /
5
 
*/
arbol5(a(1, a(2, a(4, a(5,nil,nil), nil), nil), a(3,nil,nil))).

balanceado(nil).
balanceado(a(_, HI, HD)):-
  altura(HI, AI),
  altura(HD, AD),
  R is AI - AD,
  X is abs(R),
  1 is max(1, X),
  balanceado(HI),
  balanceado(HD).
  
  /*
        1
	   / \
      2   5
	 /     \
    3       6
   /         \
  4           7
  
        1
	   / \
      2   5
	 /     
    3       
   /         
  4           
  
  */
  
 /* altura(+A, -R)
    es cierto si R unifica con la
    altura del árbol binario A
*/	

altura(nil, 0).
altura(a(_, HI, HD), R2):-
  altura(HI, RI),
  altura(HD, RD),
  R is max(RI, RD),
  R2 is R + 1.
  
/*
 crea_balanceado(+Lista, -Arbol)
  es cierto si Arbol unifica con un
  árbol binario balanceado que contiene 
  todos los elementos de Lista
*/

crea_balanceado([], nil).

crea_balanceado([Cab|Resto], a(Cab, R1, R2) ):-
  length(Resto, Length),
  Med is Length div 2,
  length(L1, Med),
  append(L1, L2, Resto),
  crea_balanceado(L1, R1),
  crea_balanceado(L2, R2).  
  
/*
 crea_abb(+Lista, -ABB)
  es cierto si ABB unifica con un árbol 
  binario de búsqueda balanceado que 
  contiene los elementos de Lista.
  Suponemos que Lista está ordenado de menor
  a mayor.
*/  
  
crea_abb([], nil).

crea_abb(Lista, a(M, R1, R2) ):-
  length(Lista, Length),
  Med is Length div 2,
  length(L1, Med),
  append(L1, [M|L2], Lista),
  crea_abb(L1, R1),
  crea_abb(L2, R2).    
