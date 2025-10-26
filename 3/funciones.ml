let rec factorial = function 0 -> 1 | n -> n * factorial (n-1);;

factorial 0 + factorial 1 + factorial 2;;
(*Devuelve 4 con tipo de dato int*)
(*Esto lo que hace es sumar el factorial de 0 con el factorial de 1 con el factorial de 2*)
factorial 10;;
(*Devuelve 3628800 con tipo de dato int*)
factorial 100;;
(*Devueve 0 con tipo de dato int*)
(*Esto es debido a que el factorial de 100 ocupa mas que lo que vale el tipo de dato int*)
factorial (-1);;
(*Devuelve "Stack overflow during evaluation (looping recursion?)."*)
(*No esta contemplado en la funcion recursiva*)

let rec sum_to = function 0 -> 0 | n -> n + sum_to (n-1);;
let rec exp_2 = function 0 -> 1 | n -> 2 * exp_2 (n-1);;
let rec num_cifras = function n -> if abs n < 10 then 1 else 1 + num_cifras (abs n / 10);;
let rec sum_cifras n = if abs n < 10 then abs n else abs n mod 10 + sum_cifras (abs n / 10);;
