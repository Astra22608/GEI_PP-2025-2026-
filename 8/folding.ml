let i_prod l = 
  List.fold_left ( * ) 1 l

let f_prod l = 
  List.fold_left ( *. ) 1.0 l

let lmin = function
  | [] -> raise (Failure "lmin: empty list")
  | h::t -> List.fold_left min h t

let lmin_lmax = function
  | [] -> raise (Failure "lmin_lmax: empty list")
  | h::t -> 
      List.fold_left (fun (min_val, max_val) x -> 
        (min min_val x, max max_val x)) (h, h) t

let last l =
  List.fold_left (fun _ x -> x) (List.hd l) l

let rev l =
  List.fold_left (fun acc x -> x :: acc) [] l

let rev_append l1 l2 =
  List.fold_left (fun acc x -> x :: acc) l2 l1

let rev_map f l =
  List.fold_left (fun acc x -> f x :: acc) [] l

let concat sl =
  List.fold_left (^) "" sl