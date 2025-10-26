let maximo = max_int;;
(*Devuelve el número 4611686018427387903, con tipo de dato int (es el valor máximo de int en OCaml)*)

let minimo = min_int;;
(*Devuelve el número -4611686018427387904, con tipo de dato int (es el valor máximo de int en OCaml)*)

minimo + maximo;;
(*Devuelve el número -1 con tipo de dato int, resultado de realizar la operación de suma entre minimo y maximo*)

minimo + maximo + 1;;
(*Devuelve el número 0 con tipo de dato int, resultado de realizar la operación de suma entre minimo y maximo, sumandole 1*)

maximo + 1;;
(*Devuelve el número -4611686018427387904 con tipo de dato int*)
(*Se produce un overflow (el máximo es 4611686018427387903)*)

minimo = maximo + 1;;
(*Devuelve un true con tipo de dato boolean*)
(*Esto sucede porque el minimo es -4611686018427387904, y al sumarle al máximo 1, se produce un overflow, por lo que es igual al minimo*)

2 * minimo;;
(*Devuelve el número 0 con tipo de dato int, debido a que se produce un overflow aritmético*)
(*Este overflow aritmético se da porque al multiplicar el número minimo representable por otro numero, nos excedemos en el número de bits que puede albergar int*)

minimo - 1 = maximo;;
(*Devuelve un true con tipo de dato boolean*)
(*Esto sucede porque el maximo es 4611686018427387903, y al restarle al minimo 1, se produce un overflow, por lo que es igual al maximo*)

2 * maximo;;
(*Devuelve el número -2 con tipo de dato int, debido a que se produce un overflow aritmético*)
(*Este overflow aritmético se da porque al multiplicar el número maximo representable por otro numero, nos excedemos en el número de bits que puede albergar int*)

let maximo = 1. /. 0.;;
(*Devuelve infinito con tipo de dato float, debido a que 1/0 es una indeterminación matemática*)

let minimo = -1.0 /. 0.;;
(*Devuelve infinito negativo con tipo de dato float, debido a que -1/0 es una indeterminación matemática*)

1. /. maximo;;
(*Devuelve el número 0 con tipo de dato float*)
(*Esto sucede debido a que al dividir 1/oo, es prácticamente 0*)

1. /. minimo;;
(*Devuelve el número -0 con tipo de dato float*)
(*Esto sucede debido a que al dividir 1/-oo, es praticamete 0 (como el signo del infinito es negativo, OCaml se lo pone tambien al 0)*)

1. /. maximo = 1. /. minimo;;
(*Devuelve true con tipo de dato bool*)

0. /. 0.;;
(*Devuelve nan con tipo de dato float*)
(*Al dividir 0/0 da un valor indeterminado, por lo que devuelve un Not a Numer (NaN)*)

maximo +. maximo;;
(*Devuelve infinity con tipo de dato float*)
(*Esto se debe que al sumar infinito mas infinito te devuelve infinito*)

maximo -. maximo;;
(*Devuelve nan con tipo de dato float*)

-. maximo = minimo;;
(*Devuelve true con tipo de dato bool*)
(*Esto es debido a que -oo (que es -. maximo) es igual a -oo (minimo)*)

(*maximo + minimo;;*)
(*Eror: This expression has type float but an expression was expected of type int*)
(*Devuelve un error debido a que estamos sumando dos valores float con un operador int*)
(*Corrección: maximo +. minimo;;*)

not (minimo < maximo);;
(*Devuelve false con tipo de dato bool*)
(*Esto sucede debido a que -oo < oo es cierto, pero al añadirle not delante pasa de true a false*)

let not = "no";;
(*Devuelve val not: string = "no"*)

(*not (minimo < maximo);;*)
(*Error: This expression has type string. This is not a function; it cannot be applied.*)
(*Esto sucede debido a que al cambiar el valor de not de una funcion a una string, no funciona*)
(*Correccion: not (minimo < maximo);; PERO SIN EJECUTAR let not = "no";;*)

Stdlib.not (minimo < maximo);;
(*Develve false con tipo de dato bool*)
(*Esto se debe a que negamos con la función "not" el valor de minimo < maximo, siendo estos -oo y oo*)
(*Al usar la libreria Stdlib de OCaml, not vuelve a funcionar como negación*)

let not = "si" in not ^ not;;
(*Devuelve "sisi" con tipo de dato string*)
(*Esto se debe a que concatenamos dos veces el valor de la variable not*)

not;;
(*Devuelve bool -> bool = <fun>*)
(*Representa la función not de OCaml*)

let multiplica x = 2 * x;;
(*Devuelve int -> int = <fun>, pasa de un valor int (x) a otro valor int (2*x)*)


let f x = 2 * x;; f (2 + 1);;
(*Devuelve el número 6 con tipo de daton int*)
(*Se realiza la función con x = 3*)

let f x = 2 * x;;f 2 + 1;;
(*Devuelve el número 5 con tipo de dato int*)
(*En este caso, al no poner los paréntesis, OCaml da prioridad a la función*)
(*por lo que calcula la función con x = 2 y le suma 1*)

let f y = 2 * y in f (f 3);;
(*Devuelve el número 12 con tipo de dato int*)
(*Esto se debe a que primero hace el calculo de la función con doble parentesis, con y = 3*)
(*Luego, con el resultado de la función, vuelve a realizar el caluclo de la función con y = 6*)

let doble z = 2 * z;;
(*Devuelve val doble : int -> int = <fun>*)

doble 2 + 1;;
(*Devuelve 5 con tipo de dato int*)
(*En este caso, al no poner los paréntesis, OCaml da prioridad a la función*)
(*por lo que calcula la función con x = 2 y le suma 1*)

doble (doble 3);;
(*Devuelve el número 12 con tipo de dato int*)
(*Aplica la función dos veces con x = 3*)

(*doble doble 3;;*)
(*Error: This function has type int -> int. It is applied to too many arguments; maybe you forgot a `;'.*)
(*Esto sucede porque esta haciendo lo siguiente: ((doble doble) 3)*)
(*Da error debido a que doble espera que le pasemos un int y le estamos pasando un function*)
(*Corrección: doble (doble 3);;*)

abs (1 - 2);;
(*Devuelve el número 1 con tipo de dato int*)
(*Calcula el valor absoluto de la operación 1 - 2 = -1*)

abs 1;;
(*Devuelve el número 1 con tipo de dato int*)
(*Calcula el valor absoluto de 1*)

(*abs -1;;*)
(*Error: This expression has type int -> int but an expression was expected of type int*)
(*Esto pasa porque OCaml esta haciendo abs - 1 como una resta*)
(*Corrección: abs(-1);;*)

let abs x = if x >= 0. then x else -. x;;
(*Devuelve val abs : float -> float = <fun>*)

(*abs 1;;*)
(*Error: This expression has type int but an expression was expected of type float. Hint: Did you mean `1.'?*)
(*Devuelve error porque al hacer anteriormente let abs = function x -> if x >= 0. then x else -. x;;*)
(*la función espera un valor float y no int*)
(*Corrección: abs 1. ;;*)

abs 1.5;;
(*Devuelve el número 1.5 con tipo de dato float*)

Stdlib.abs 1;;
(*Devuelve 1 con tipo de dato int*)
(*Al añadirle la libreria Stdlib de OCaml, la función abs vuelve a funcionar como valor absoluto*)

let suma  (x,y) = x + y;;
(*Devuelve val suma : int * int -> int = <fun>*)

2 * suma (2,3) - suma (1,1);;
(*Devuelve el número 8 con tipo de dato int*)

let sumac x y = x+y;;
(*Devuelve val sumac : int -> int -> int = <fun>*)

sumac 3;;
(*Devuelve int -> int = <fun>*)

(sumac 3) 2;;
(*Devuelve el número 5 con tipo de dato int*)

sumac 3 2;;
(*Devuelve el número 5 con tipo de dato int*)

suma (3,2) = sumac 3 2;;
(*Devuelve true con tipo de dato bool*)
(*Esto se debe a que en este caso, la funcion suma (3,2) devuelve lo mismo que sumac 3 2*)

(*suma 3;;*)
(*Error: This expression has type int but an expression was expected of type int * int*)
(*La función suma exige una tupla con dos valores int, si le pasamos solo un valor, nos devolvera error*)
(*Corrección: suma (3,4);;*)

let suma5 = sumac 5;;
(*Devuelve val suma5 : int -> int = <fun>*)

suma5 10;;
(*Devuelve el número 15 con tipo de dato int*)
(*Esta función calcula el número con sumac*)

let sumac x y = x + y;;
(*Devuelve val sumac : int -> int -> int = <fun>*)

sumac 3 2;;
(*Devuelve el número 5 con tipo de dato int*)

let sumac x y = x + y;;
(*Devuelve val sumac : int -> int -> int = <fun>*)

sumac 3 2;;
(*Devuelve el número 5 con tipo de dato int*)