
/*

  Árboles genéricos
  
      1    arbol1
	/ | \ 
   3  4  5
 
   Árbol más pequeño (n0): a(E, [])
   
   a(E, ListaHijos)
  
   ListaHijo es una lista de árboles

             1        arbol2
		   / | \ 
          2  3  4
		 /|\    |
        5 6 7   8
*/
arbol1(a(1, [a(3,[]), a(4, []), a(5, [])])).
arbol2(
   a(1,[a(2,[a(5,[]),a(6,[]),a(7,[])]),a(3,[]),a(4,[a(8,[])])])
).

/*
pertenece(E, Arbol)
 es cierto si el elemento E pertenece al 
 árbol genérico Arbol.
*/

/* predicado para árboles */

pertenece(E, a(E, _)).
pertenece(E, a(Et, ListaHijos)):-
  E \= Et, 
  pertenece(E, ListaHijos).

/* predicado para lista de árboles */

pertenece(E, [Cab|_]):-
  pertenece(E, Cab).
pertenece(E, [_|Resto]):-
  pertenece(E, Resto).  
  
  
/* cuenta_nodos(+Arbol, -N)
   es cierto si N unifica con el número de
   nodos del árbol genérico Arbol
*/

/* predicado para arboles  */

cuentaNodosArbol(a(_,Lista), N2) :- 
  cuentaNodosListaArboles(Lista,N),N2 is N+1.

/* predicado para listas */

cuentaNodosListaArboles([],0).
cuentaNodosListaArboles([Cabeza|Resto], N3 ) :- 
   cuentaNodosArbol(Cabeza,N) , 
   cuentaNodosListaArboles(Resto,N2), 
   N3 is N + N2.
   

/* hojas(+Arbol, -ListaHojas)
   es cierto si ListaHojas unifica con la lista
   de las etiquetas de las hojas del árbol Arbol.
*/

/* predicado para árboles */

hojas(a(E, []), [E]). /* es una hoja */
hojas(a(_, ListaHijos), R):- /* no es una hoja */
  ListaHijos \= [],
  hojas(ListaHijos, R).

/* predicado para lista de árboles */

hojas([], []).
hojas([Cab|Resto], ListaHojas):-
  hojas(Cab, H1), 
  hojas(Resto, H2), 
  append(H1, H2 , ListaHojas).

/* crea(+Lista, -Arbol)
  es cierto si Arbol unifica con un 
  árbol genérico que contiene todos
  los elementos de Lista.
*/

creaArbol([Cab|Resto], a(Cab, R)):-
  creaListaArboles(Resto, R).

creaListaArboles([], []).
creaListaArboles([Cab|Resto], [a(Cab,[])|R]):-
  creaListaArboles(Resto, R).
  
  
/* anchura(+Arbol, -Lista)
  es cierto si Lista unifica con una lista
  que contiene las etiquetas del recorrido 
  en anchura del árbol genérico A.

             1        arbol2
		   / | \ 
          2  3  4   5    6   7 
		 /|\    |  / \       |
        5 6 7   8 9  10      11
       / \  | 
      9	 10 11 
	  
	  
	         1        arbol2
		   / | \ 
          2  3  4   5    6   7    5   6  7  8 9 10 11
		 /|\    |  / \       |   / \
        5 6 7   8 9  10      11
       / \  | 
      9	 10 11 
	   
	            a(5, [a(9,[]), a(10, [])]
	 	  
	  
	         1        
		   / | \  \    \   \
          2  3  4   5   6   7  8 9 10 11
		                
*/ 

arbol3(
   a(1,[a(2,[a(5,[a(9,[]), a(10,[])]),a(6,[]),a(7,[a(11,[])])]),a(3,[]),a(4,[a(8,[])])])
).
/* predicado para árboles */

anchura(a(E, L), [E|R]):-
  anchura(L, R).

/* predicado para lista de árboles */
anchura([], []).
anchura([a(E, L)|Resto], [E|R2]):-
  append(Resto, L, R),
  anchura(R, R2).

 
 



