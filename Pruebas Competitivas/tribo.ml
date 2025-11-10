(*  Autor: Candela Naya López *)
(*  Prueba práctica competitiva – Sucesión de Tribonacci (OCaml) *)

open Z

(* Matriz 3x3 como tupla de 9 elementos *)
type matrix = Z.t * Z.t * Z.t * Z.t * Z.t * Z.t * Z.t * Z.t * Z.t

(* Matriz identidad *)
let identidad = 
  (Z.one,  Z.zero, Z.zero,
   Z.zero, Z.one,  Z.zero, 
   Z.zero, Z.zero, Z.one)

(* Matriz de transformación de Tribonacci *)
let matriz_tribonacci = 
  (Z.one, Z.one, Z.one,
   Z.one, Z.zero, Z.zero,
   Z.zero, Z.one, Z.zero)

(* Multiplicación de matrices optimizada - SIN funciones auxiliares redundantes *)
let mult_matriz (a11, a12, a13, a21, a22, a23, a31, a32, a33) 
                (b11, b12, b13, b21, b22, b23, b31, b32, b33) =
  (* Calculamos todos los elementos directamente *)
  ( Z.add (Z.add (Z.mul a11 b11) (Z.mul a12 b21)) (Z.mul a13 b31),  
    Z.add (Z.add (Z.mul a11 b12) (Z.mul a12 b22)) (Z.mul a13 b32),  
    Z.add (Z.add (Z.mul a11 b13) (Z.mul a12 b23)) (Z.mul a13 b33),  
    Z.add (Z.add (Z.mul a21 b11) (Z.mul a22 b21)) (Z.mul a23 b31),  
    Z.add (Z.add (Z.mul a21 b12) (Z.mul a22 b22)) (Z.mul a23 b32),  
    Z.add (Z.add (Z.mul a21 b13) (Z.mul a22 b23)) (Z.mul a23 b33),  
    Z.add (Z.add (Z.mul a31 b11) (Z.mul a32 b21)) (Z.mul a33 b31),  
    Z.add (Z.add (Z.mul a31 b12) (Z.mul a32 b22)) (Z.mul a33 b32),  
    Z.add (Z.add (Z.mul a31 b13) (Z.mul a32 b23)) (Z.mul a33 b33)   
  )

(* Exponenciación rápida de matrices *)
let rec potencia_matriz m n =
  if Z.equal n Z.zero then identidad
  else if Z.equal n Z.one then m
  else
    let mitad = potencia_matriz m (Z.shift_right n 1) in
    let cuadrado = mult_matriz mitad mitad in
    if Z.testbit n 0 then mult_matriz m cuadrado else cuadrado

(* Cálculo del término n-ésimo de Tribonacci *)
let tribonacci n =
  if Z.compare n Z.zero < 0 then Z.zero
  else if Z.equal n Z.zero then Z.zero
  else if Z.equal n Z.one then Z.zero
  else if Z.equal n (Z.of_int 2) then Z.one
  else
    let resultado = potencia_matriz matriz_tribonacci (Z.sub n (Z.of_int 2)) in
    match resultado with
    | (x, _, _, _, _, _, _, _, _) -> x  (* Solo necesitamos el elemento (0,0) *)

(* Punto de entrada principal *)
let () =
  if Array.length Sys.argv <> 2 then (
    Printf.eprintf "Uso: %s <n>\n" Sys.argv.(0);
    exit 1
  )
  else
    let n = Z.of_string Sys.argv.(1) in
    let resultado = tribonacci n in
    Z.print resultado;
    print_newline ()