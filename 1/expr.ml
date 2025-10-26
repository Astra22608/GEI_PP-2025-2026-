0;;
(*Devuelve el número 0 con tipo de dato int*)

0.;;
(*Devuelve el número 0 con tipo de dato float*)

(* un comentario es como un espacio en blanco *) "hola";;
(*Devuelve la cadena "hola" con tipo de dato string, debido a que todo el texto anterior es un comentario*)

2 + 5 * 3;;
(*Devuelve el número 17 con tipo de dato int*)

2 + (* 5 **) 3;;
(*Devuelve el número 5 con tipo de dato int*)

2 + (* 5 *(*esto es un comentario anidado*)*) 3;;
(*Devuelve el número 5 con tipo de dato int*)

(*1.5 * 2;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(*Devuelve error, debido a que estamos operando valores tipo float con un operador para tipos int*)
(*Corrección: 1.5 *. 2.;;*)

(*1.5 *. 2;;*)
(*Error: This expression has type int but an expression was expected of type float.Hint: Did you mean `2.'?*)
(*Devuelve error debido a que estamos multiplicando como si fueran datos tipo float cuando hay un dato tipo int*)
(*Corrección: 1.5 *. 2.;;*)

1.5 *. 2.;;
(*Devuelve el número 3 como resultado de la operación, con tipo de dato float. Para realizar operaciones con floats debemos poner un punto detras del operador*)

(*2 - 0.5;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(*Devuelve error, debido a que estamos operando valores tipo float con un operador de tipos int*)
(*Corrección: 2.0 -. 0.5*)

(*2. - 0.5;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(*Devuelve error porque los elementos son tipo float cuando el operador es para tipos int*)
(*Corrección: 2.0 -. 0.5;;*)

2. -. 2.0;;
(*Devuelve el número 0 como resultado de la operación, con tipo de dato float*)

(*2.5 - 0.5;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(*Devuelve error debido a que estamos operando dos números tipo float con un operador para tipos int*)
(*Corrección: 2.5 -. 0.5;;*)

2.5 -. 0.5;;
(*Devuelve el número 2 como resultado de la operación, con tipo de dato float*)

5 / 2;;
(*Devuelve el número 2 como valor de la división entera (sin decimales ni resto) de la operación, con tipo de dato int*)

5. /. 2.;;
(*Devuelve el número 2.5 como valor de la división con decimales de la operación, con tipo de dato float*)

17 mod 3;;
(*Devuelve el número 2 como valor del resto al hacer la división de esos dos número, con tipo de dato int*)

(*2 ** 3;;*)
(*Error: This expression has type int but an expression was expected of type float. Hint: Did you mean `2.'?*)
(*Devuelve error, debido a que los números estan en tipo int cuando se esperaba que estuvieran en tipo float*)
(*Corrección: 2.0 ** 3.0;;*)

(*2. ** 3;;*)
(*Error: This expression has type int but an expression was expected of type float. Hint: Did you mean `3.'?*)
(*Devuelve error, debido a que el número 3 esta en tipo int cuando se esperaba que estuvieran en tipo float*)
(*Corrección: 2.0 ** 3.0;;*)

2. ** 3.;;
(*Devuelve el número 8 como resultado de la operación, con tipo de dato float*)

2. *. 3. ** 2.;;
(*Devuelve el número 18 como resultado de la operación, con tipo de dato float*)

(2. *. 3.) ** 2.;;
(*Devuelve el número 36 como resultado de la operación, con tipo de dato float*)

2. ** 3. ** 2.;;
(*Devuelve el número 512 como resultado de la operación, con tipo de dato float*)

(2. ** 3.) ** 2.;;
(*Devuelve el número 64 como resultado de la operación, con tipo de dato float*)

sqrt 2.;;
(*Devuelve el número 1.41421356237309515 como resultado de resolver la raíz cuadrada de 2, con tipo de dato float*)

(*sqrt 4;;*)
(*Error: This expression has type int but an expression was expected of type float. Hint: Did you mean `4.'?*)
(*Devuelve error, debido a que para calcular la raíz cuadrada tenemos que usar un número de tipo float, y el 4 esta en tipo int*)
(*Corrección: sqrt 4.;;*)

sqrt 2. *. 3.;;sqrt (2. *. 3.);;
(*Devuelve el número 4.24264068711928566 como solución de la operación, con tipo de dato float*)

2 + 1 = 23 / 7;;
(*Devuelve true, porque el resultado de las dos lados del igual es la misma*)

2 + 1 <> 23 / 7;;
(*Devuelve false, porque el resultado de las dos lados del operador no es la misma*)

sin 1. ** 2. +. cos 1. ** 2. = 1.;;
(*Devuelve true, porque el resultado de la operación es igual a 1*)

sqrt 2. ** 2. = 2.;;
(*Devuelve false, porque el resultado de la operación no es igual a 2*)

1 + 2 <= 3;;
(*Devuelve true, porque el resultado de la operación es menor o igual a 2*)

0.1 +. 0.2 <= 0.3;;
(*Devuelve false, debido a que OCaml usa un tipo de representación de números (aritmética de punto flotante binario)*)
(*Esto provoca que no se represente de manera exacta el 0.1 y el 0.2, por lo que al realizar la operación nos da un valor distinton de 0.3*)

3.0 = float_of_int 3;;
(*Devuelve true, porque el número 3 es de tipo float, y el float_of_int 3 hace que el 3 se convierta en float*)

int_of_float 2.1;;
(*Devuelve el número 2, con tipo de dato int*)

(*int_of_float -2.9;;*)
(*Error: This expression has type float -> int but an expression was expected of type int*)
(*Devuelve error porque a una función (float -> int) le restamos un valor float*)
(*Corrección: int_of_floar (-2.9);;*)

int_of_float 2.1 + int_of_float (-2.9);;
(*Devuelve el número 0 como resultado de la operación, con tipo de dato int*)

truncate 2.1 + truncate (-2.9);;
(*Devuelve el número 0 como resultado de la operación (en este caso trunca los números), con tipo de dato int*)

floor 2.1 +. floor (-2.9);;
(*Devuelve el número -1 (floor: devuelve el mayor número entero (float), menor o igual que el argumento), con tipo float*)

ceil 2.1 +. ceil (-2.9);;
(*Devuelve el número 1 (ceil: (complemento de floor) devuelve el menor número entero (como float) mayor o igual que el argumento)*)

'A';;
(*Devuelve la letra 'A' con tipo de dato char*)

'0';;
(*Devuelve '0' con tipo de dato char*)

int_of_char 'A';;
(*Devuelve el número 65 con tipo de dato int*)

char_of_int 66;;
(*Devuelve la letra 'B' con tipo de dato char*)

Char.code 'B';;
(*Devuelve el número 66 con tipo de dato int*)

Char.chr 67;;
(*Devuelve la letra 'C' con tipo de dato char*)

'\067';;
(*Devuelve la letra 'C' con tipo de dato char*)

'\n';;
(*Devuelve '\n' con tipo de dato char*)

Char.code '\n';;
(*Devuelve el número 10 con tipo de dato int*)

'\010';;
(*Devuelve '\n' con tipo de dato char*)

'\t';;
(*Devuelve '\t' con tipo de dato char*)

Char.chr (Char.code 'M' + Char.code 'a' - Char.code 'A');;
(*Devuelve la letra 'm' con tipo de dato char*)

Char.lowercase_ascii 'M';;Char.uppercase_ascii 'm';;
(*Devuelve la letra 'm' con tipo de dato char*)

Char.lowercase_ascii 'm';;
(*Devuelve la letra 'm' con tipo de dato char*)

Char.uppercase_ascii '0';;
(*Devuelve '0' con tipo de dato char*)

Char.lowercase_ascii '0';;
(*Devuelve '0' con tipo de dato char*)

"esto es un string";;
(*Devuelve "esto es un string" con tipo de dato string*)

"A";;
(*Devuelve la letra "A" con tipo de dato string*)

"AB";;
(*Devuelve las letras "AB" con tipo de dato string*)

(*'AB';;*)
(*Error: Syntax error*)
(*Devuelve error, porque las comillas simples sirven para carácteres, no para cadenas de ellos*)
(*Corrección: "AB";;*)

String.length "longitud";;
(*Devuelve el número 8, que es el número de letras que tiene la palabra "longitud", con tipo de dato int*)

(*"1999" + "1";;*)
(*Error: This expression has type string but an expression was expected of type int*)
(*Devuelve error debido a que en la suma se esperan dos valores int, pero en este caso da dos valores string*)
(*Corrección: "1999" ^ "1";;*)

"1999" ^ "1";;
(*Devuelve "19991" con valor de concatenación de ambos strings, con tipo de dato string*)

int_of_string "1999" + 1;;
(*Devuelve como resultado 2000, luego de pasar a tipo int el string 1999 y sumarle 1*)

"\065\066";;
(*Devuelve las letras "AB" con tipo de dato string*)

"\t\n";;
(*Devuelve "\t\n" con tipo de dato string*)

010 = 10;;
(*Devuelve true, debido a que en ocaml 010 es lo mismo que 10*)

char_of_int 010;;
(*Devuelve '\n' con tipo de dato char*)

string_of_int 10;;
(*Devuelve "10" con tipo de dato string*)

string_of_int 010;;
(*Devuelve "10" con tipo de dato string*)

not true;;
(*Devuelve false, debido a que estamos negando el true*)

true && false;;
(*Devuelve false, debido a que no puede suceder true and false (tienen que ser los dos iguales)*)

true || false;;
(*Devuelve true, debido a que  puede suceder true or false (que una de las dos sea verdad)*)

(1 < 2) = false;;
(*Devuelve false, debido a que 1<2 es verdadero, pero al compararlo con false el resultado es false*)

not (1 < 2);;
(*Devuelve false, debido a que 1<2 es verdadero, y si lo negamos devuelve false*)

'1' < '2';;
(*Devuelve true, debido a que esta comparando los número de la tablas ASCII (donde 1 = 49 y 2 = 50), entonces se cumple la comparación*)

"1" < "2";;
(*Devuelve true, debido a que esta comparando los número de la tablas ASCII (donde 1 = 49 y 2 = 50), entonces se cumple la comparación*)

2 < 12;;
(*Devuelve true, debido a que esta comparando si el número 2 es menor que 12, lo cúal es correcto*)

"2" < "12";;"uno" < "dos";;
(*Devuelve false, debido a que esta comparando los elemenos de la tablas ASCII, en el primer caso compara el 2 con el primero número de la cadena (1), mientras que en la segunda compara el número donde se encuentra la u con la de la d*)

if 3 = 4 then 0 else 4;;
(*Devuelve el número 4 con tipo de dato int, debido a que la condición del if no se cumple*)

if 3 = 4 then "0" else "4";;
(*Devuelve el número 4 con tipo de dato string, debido a que la condición del if no se cumple*)

(*if 3 = 4 then 0 else "4";;*)
(*Error: This expression has type string but an expression was expected of type int*)
(*Devuelve error, porque debemos mantener un único tipo de dato para devolver (por ejemplo, debemos devolver siempre int o siempre char)*)
(*Corrección: if 3 = 4 then 0 else 4;;*)

(if 3 < 5 then 8 else 10) + 4;;
(*Devuelve el número 12 con tipo de dato int, debido a que dentro de la condición se cumple el if (dando como resultado 8), al que le sumamos 4*)

2.3;;
(*Devuelve el número 2.3 con tipo de dato float*)

2,3;;
(*Devuelve las coordenadas (2,3), con tipo de dato int * int*)

(2, 3);;
(*Devuelve las coordenadas (2,3), con tipo de dato int * int*)

('1', '2');;
(*Devuelve las coordenadas ('1', '2'), con tipo de dato char * char*)

(1, '2');;
(*Devuelve las coordenadas (1, '2'), con tipo de dato int * char*)

1, ('a', 'b');;
(*Devuelve las coordenadas (1,('a', 'b')), con tipo de dato int * (char * char)*)

(true, "not false");;
(*Devuelve las coordenadas (true, "not false"), con tipo de dato bool * string*)

1, 'a', 'b';;
(*Devuelve las coordenadas (1,'a','b'), con tipo de dato int * char * char*)

(1, '1', "1");;
(*Devuelve las coordenadas (1,'1',"1"), con tipo de dato int * char * string*)

("1");;
(*Devuelve ("1"), con tipo de de dato string*)

();;
(*Devuelve (), con tipo de dato unit: usados para funciones que no necesitan devolver ningún valor*)

(());;
(*Devuelve (), con tipo de dato unit: usados para funciones que no necesitan devolver ningún valor*)

0, ();;
(*Devuelve las coordenadas (0, ()), con tipo de dato int * unit*)

[1; 2; 3];;
(*Devuelve una lista [1;2;3], con tipo de dato int list*)

[1; 1; 1];;
(*Devuelve una lista [1;1;1], con tipo de dato int list*)

[3; 2; 1; 0];;
(*Devuelve una lista [3;2;1;0], con tipo de dato int list*)

['a'; 'b'];;
(*Devuelve una lista ['a; 'b'], con tipo de dato char list*)

(*['a'; 2];;*)
(*Error: This expression has type int but an expression was expected of type char*)
(*Devuelve error debido a que no se pueden hacer listas con elementos de distintos tipos*)
(*Corrección: ['a'; '2'];;*)

['0'];;
(*Devuelve una lista ['0'], con tipo de dato char list*)

[1; 2; 3] @ [-1; 11];;
(*Devuelve una lista [1; 2; 3; -1; 11], con tipo de dato int list. El @ lo que hace es concatenar las dos listas*)