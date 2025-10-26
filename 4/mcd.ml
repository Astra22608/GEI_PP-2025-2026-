(*Algoritmo de Euclides*)
let rec mcd (a,b) = if a = 0 then b else if b = 0 then a else if a > b then mcd (a-b, b) else mcd (a, b-a);;

(*Mejora del Algoritmos de Euclides*)
let rec mcd'(a,b) = if b = 0 then a else mcd (b, a mod b);;