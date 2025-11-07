let from0to n =
  if n < 0 then raise (Failure "from0to: negative input")
  else List.init (n + 1) (fun i -> i)

let to0from n =
  if n < 0 then raise (Failure "to0from: negative input")
  else List.init (n + 1) (fun i -> n - i)

let pair x ys =
  List.map (fun y -> (x, y)) ys

let remove x l =
  let rec aux found acc = function
    | [] -> List.rev acc
    | h::t when not found && h = x -> aux true acc t
    | h::t -> aux found (h :: acc) t
  in
  aux false [] l

let remove_all x l =
  List.filter (fun y -> y <> x) l

let remove_duplicates l =
  List.fold_left (fun acc x -> 
    if List.mem x acc then acc else x :: acc) [] l 
  |> List.rev

let ldif l1 l2 =
  List.filter (fun x -> not (List.mem x l2)) l1