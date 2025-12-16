let front lst =
  let rec aux acc = function
    | [] -> raise (Failure "front")
    | [_] -> List.rev acc          
    | h :: t -> aux (h :: acc) t   
  in
  aux [] lst

let compress lst =
  let rec aux acc = function
    | [] -> List.rev acc
    | [x] -> List.rev (x::acc)
    | h1::h2::t ->
        if h1 = h2 then
          aux acc (h2::t)
        else
          aux (h1::acc) (h2::t)
  in
  aux [] lst


let fold_right f lst init =
  let rec aux cont = function
    | [] -> cont init
    | h::t -> aux (fun acc -> cont (f h acc)) t
  in
  aux (fun x -> x) lst
