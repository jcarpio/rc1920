
/* Problemas de Estados
   
      |     |   
      |     |  M M M	
      |    _|  C C C	  


   1. Definición del estado
   estado(Num_mi_izq, Num_can_izq, Pos_barca)
   
   Estado Inicial: estado(0, 0, der).
   Estado Final: estado(3, 3, _).

   2. Definición de los movimientos
   
   mov( pasar(M, C, dch), 
      estado(MIzq, CIzq, ), ):-   
   
*/ 

/* valido */

valido(estado(1,1,_)).
valido(estado(3,0,_)).
valido(estado(3,1,_)). 
valido(estado(3,2,_)).
valido(estado(3,3,_)).
valido(estado(2,2,_)).
valido(estado(0,0,_)).
valido(estado(0,1,_)).
valido(estado(0,2,_)).
valido(estado(0,3,_)).

pasar(1,0,izq).
pasar(1,0,dch).
pasar(0,1,izq).
pasar(0,1,dch).
pasar(2,0,izq).
pasar(2,0,dch).
pasar(0,2,izq).
pasar(0,2,dch).
pasar(1,1,izq).
pasar(1,1,dch).

mov( pasar(M, C, dch), 
      estado(MIzq, CIzq, izq), 
	  estado(MIzq2, CIzq2, dch)):- 
      MIzq2 is MIzq - M,
      CIzq2 is CIzq - C.
	  
mov( pasar(M, C, izq),
     estado(MIzq, CIzq, dch),
     estado(MIzq2, CIzq2, izq)):-
     MIzq2 is MIzq + M,
     CIzq2 is CIzq + C.
    	 
	  
/* camino(+Ini, +Final, +Visitado, -Camino)
   es cierto si Camino unifica con una lista de movimientos
   para pasar del estado Ini al estado Final sin
   repetir los estados de la lista de estados
   Visitados.


*/

camino(Ini, Ini, _, []).

camino(estado(MI, CI, izq), Final, Visitados, [pasar(M,C,dch)|Camino]):-
  pasar(M, C, dch), 
  MI >= M, CI >= C,
  mov(pasar(M, C, dch), estado(MI, CI, izq), Tmp),
  valido(Tmp),
  \+ member(Tmp, Visitados),
  camino(Tmp, Final, [Tmp|Visitados], Camino).  

camino(estado(MI, CI, dch), Final, Visitados, [pasar(M,C,izq)|Camino]):-
  pasar(M, C, izq), MD is 3 - MI, CD is 3 - CI, 
  MD >= M, CD >= C,
  mov(pasar(M, C, izq), estado(MI, CI, dch), Tmp),
  valido(Tmp),
  \+ member(Tmp, Visitados),
  camino(Tmp, Final, [Tmp|Visitados], Camino).  
