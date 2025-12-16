(* 
   EXPLICACIÓN DE LA INEFICIENCIA:
   
   La versión con fold_left es muy ineficiente porque List.append tiene que
   recorrer TODA la lista acumulada (acc) cada vez que concatena un nuevo elemento.
      
*)

(*let l = List.init 50_000 (fun i -> [i])*)

(* Usa fold_right: eficiente porque append recorre solo h, no acc *)
let concat' l =
  List.fold_right (fun h acc -> List.append h acc) l []
(* Más eficiente que fold_left porque List.append h acc solo recorre
  la sublista actual h (normalmente corta), mientras acc ya está construida.*)

(* Versión recursiva terminal, sin usar List.append *)
let concat'' l =
  let rec aux acc = function
    | [] -> List.rev acc
    | h :: t ->
        let rec copy acc = function
          | [] -> aux acc t
          | x :: xs -> copy (x :: acc) xs
        in copy acc h
  in aux [] l

let sublists lst =
  let rec aux acc = function
    | [] -> List.rev acc
    | h :: t ->
        let new_sublists = List.map (fun s -> h :: s) acc in
        let new_acc = List.rev_append new_sublists acc in
        aux new_acc t
  in
  aux [[]] lst
