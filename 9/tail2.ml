
(* FRONT: NO puede usar TMC eficientemente *)
(*
   front construye la lista al revés, pero necesita saber
   cuál es el último elemento antes de construir el resultado.
   No usar TMC porque la recursión no está directamente
   bajo un constructor (::) de forma que el compilador pueda optimizarla fácilmente.
   
   La mejor versión sigue siendo una recursiva terminal con acumulador explícito.
*)
let front lst =
  match lst with
  | [] -> raise (Failure "front")
  | [_] -> []  (* Caso especial para listas de un elemento *)
  | _ ->
      let rec aux acc = function
        | [_] -> List.rev acc  (* Devuelve acumulado invertido, excluyendo el último *)
        | h :: t -> aux (h :: acc) t
        | [] -> failwith "unexpected"  (* No debería ocurrir *)
      in aux [] lst

(* COMPRESS: SÍ puede usar TMC *)
(*
   compress puede usar TMC porque la llamada recursiva
   aparece directamente como argumento del constructor (::).
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
   
   Alternativa recomendada (comentada abajo): Usar List.rev + List.fold_left.
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
      - TMC: No aplicable de forma útil (la recursión requiere conocimiento del final, no encaja en el patrón TMC).
   
   2. COMPRESS:
      - TMC: Si aplicable de forma útil. Con [@@tail_mod_cons], el compilador la hace terminal automáticamente, evitando stack overflow.
   
   3. FOLD_RIGHT:
      - TMC: No aplicable (recursión en funciones, no constructores).
   
   VENTAJAS DE TMC:
   + Código más simple y legible (parece recursivo normal, pero optimizado).
   + No requiere List.rev al final (mantiene orden naturalmente).
   + Optimizado por el compilador automáticamente (tail-recursive interna).
   + Evita stack overflow sin reescribir manualmente.
   
   DESVENTAJAS DE TMC:
   - Solo funciona para patrones específicos (recursión bajo constructor como ::).
   - No aplicable a todas las funciones; para las no elegibles, usa acumuladores o continuaciones.
   
   En general, para listas largas (e.g., >100k), las versiones terminales/TMC superan a las no-terminales en estabilidad (sin overflows). TMC brilla en simplicidad para funciones como compress.
*)
