(* FRONT: NO puede usar TMC eficientemente *)
(*
   front construye la lista al revés mentalmente, pero necesita saber
   cuál es el último elemento antes de construir el resultado.
   No es un buen candidato para TMC porque requiere conocer el final.
   
   La mejor versión sigue siendo la del tail.ml con acumulador explícito.
*)
let front lst =
  let rec aux acc prev = function
    | [] -> raise (Failure "front")
    | [_] -> List.rev acc
    | h::t -> aux (prev::acc) h t
  in
  match lst with
  | [] -> raise (Failure "front")
  | h::t -> aux [] h t

(* COMPRESS: SÍ puede usar TMC *)
(*
   compress es un excelente candidato para TMC porque la llamada recursiva
   aparece directamente como argumento del constructor (::)
*)
let rec compress = function
  | [] -> []
  | [x] -> [x]
  | h1::h2::t ->
      if h1 = h2 then
        compress (h2::t)  
      else
        h1 :: compress (h2::t)
[@@tail_mod_cons]

(* FOLD_RIGHT: NO puede usar TMC directamente *)
(*
   fold_right no puede usar TMC porque la llamada recursiva no aparece
   directamente en un constructor, sino dentro de la aplicación de una función.
   
   La mejor implementación sigue siendo con continuaciones o con List.rev + fold_left
*)
let fold_right f lst init =
  let rec aux cont = function
    | [] -> cont init
    | h::t -> aux (fun acc -> cont (f h acc)) t
  in
  aux (fun x -> x) lst

(*
   CONCLUSIONES Y COMPARACIÓN DE RENDIMIENTO:
   
   1. FRONT:
      - TMC: No aplicable de forma útil
      - Versión con acumulador (tail.ml): Mejor opción
   
   2. COMPRESS:
      - TMC: ¡EXCELENTE CANDIDATO!
      - La versión con [@tail_mod_cons] es más simple y clara que la versión
        con acumulador explícito
   
   3. FOLD_RIGHT:
      - TMC: No aplicable (la recursión no está en un constructor)
      - Versión con continuaciones: Puede causar stack overflow en listas grandes
   
   VENTAJAS DE TMC:
   + Código más simple y legible
   + No requiere List.rev al final (mantiene orden naturalmente)
   + Optimizado por el compilador automáticamente
   + Stack overflow evitado por la optimización del compilador
   
   DESVENTAJAS DE TMC:
   - Solo funciona para casos específicos (constructor como contexto inmediato)
   - Requiere OCaml 5.0 o superior
   - No aplicable a todas las funciones recursivas
*)


