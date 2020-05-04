/*
  bin2gen(+ArbolBinario, -ArbolGenerico)
  
  es cierto si ArbolGenerico unifica con un
  árbol genérico equivalente al árbol binario
  ArbolBinario.
  
  bin2gen(a(1,nil,nil), R).
  R=a(1,[])
  
  bin2gen(a(1,a(2,nil,nil), a(3,nil,nil)), R).
  R=a(1,[a(2,[]), a(3,[])]).
  
        1
	   / \
      2   3 

       1
	    / \  
     /   \
    2     3	  
   / \   / \
  4   5 6   7 
  
*/
   
arbol1( a(1, a(2, nil, nil), a(3, nil, nil)) ).
arbol2(a(1, a(2, a(4,nil,nil), a(5,nil,nil)), a(3, a(6,nil,nil),a(7,nil,nil)))).


bin2gen(a(E,nil, nil), a(E, [])).

bin2gen(a(E, HI, HD), a(E, [RI, RD])):-
  HI \= nil, HD \= nil,
  bin2gen(HI, RI),
  bin2gen(HD, RD).
  
bin2gen(a(E, nil, HD), a(E, [RD])):-
  HD \= nil,
  bin2gen(HD, RD).
  
bin2gen(a(E, HI, nil), a(E, [RI])):-
  HI \= nil,
  bin2gen(HI, RI).
