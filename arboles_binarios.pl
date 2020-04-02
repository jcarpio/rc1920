
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
