(* 
   EXPLICACIÓN DE LA INEFICIENCIA:
   
   La versión con fold_left es muy ineficiente porque List.append tiene que
   recorrer TODA la lista acumulada (acc) cada vez que concatena un nuevo elemento.
      
*)

let l = List.init 50_000 (fun i -> [i])

let concat' l =
  List.fold_right (fun h acc -> List.append h acc) l []

let concat'' l =
  let rec aux_list acc = function
    | [] -> acc
    | h::t -> aux_list (h::acc) t
  in
  let rec aux_main acc = function
    | [] -> List.rev acc
    | h::t -> aux_main (aux_list acc (List.rev h)) t
  in
  aux_main [] l

let sublists lst =
  let rec aux = function
    | [] -> [[]]
    | h::t ->
        let subs = aux t in
        subs @
        List.map (fun sub -> h::sub) subs
  in
  aux lst

