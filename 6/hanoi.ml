(* devuelve el poste que no es ori ni des *)
let otro ori des =
  match (ori, des) with
  | (1, 2) | (2, 1) -> 3
  | (1, 3) | (3, 1) -> 2
  | (2, 3) | (3, 2) -> 1
  | _ -> ori  (* caso que no debería ocurrir *)

(* representación visual de un movimiento *)
let mueve (ori, des) =
  match (ori, des) with
  | (1, 2) -> "1---2   3\n"
  | (2, 1) -> "1   2---3\n"
  | (1, 3) -> "1---2-->3\n"
  | (3, 1) -> "1<--2---3\n"
  | (2, 3) -> "1   2-->3\n"
  | (3, 2) -> "1   2<--3\n"
  | _ -> ""

(* hanoi recursivo correcto *)
let rec hanoi n ori des =
  if n = 0 || ori = des then ""
  else
    let o = otro ori des in
    hanoi (n-1) ori o ^ mueve (ori, des) ^ hanoi (n-1) o des

(* imprime la solución con validación de argumentos *)
let print_hanoi n ori des =
  if n < 0 || ori < 1 || ori > 3 || des < 1 || des > 3 then
    print_endline "**ERROR**\n"
  else
    print_endline ("=========\n" ^ hanoi n ori des)

(* devuelve el k-ésimo movimiento (1-based) como par (ori,des) *)
(* devuelve el n-ésimo movimiento en la resolución con nd discos *)
let rec n_hanoi_mov n nd ori des =
  if nd <= 0 then failwith "nd debe ser >= 1"
  else if ori = des then failwith "ori y des deben ser distintos"
  else
    let mitad = 1 lsl (nd - 1) in  (* 2^(nd-1) *)
    if n < mitad then
      (* fase 1 *)
      let aux = otro ori des in
      n_hanoi_mov n (nd - 1) ori aux
    else if n = mitad then
      (* movimiento central *)
      (ori, des)
    else
      (* fase 3 *)
      let aux = otro ori des in
      n_hanoi_mov (n - mitad) (nd - 1) aux des

let crono f x =
  let t = Sys.time () in
  f x; Sys.time () -. t