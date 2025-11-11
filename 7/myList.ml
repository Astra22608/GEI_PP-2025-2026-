let hd lista =
    match lista with
    | [] -> raise (Failure "hd")
    | h :: _ -> h

let tl lista =
    match lista with 
    | [] -> raise (Failure "tl")
    | _ :: t -> t 

let rec last lista =
    match lista with
    | [] -> raise (Failure "last")
    | [x] -> x
    | _ :: t -> last t 

let rec length lista = 
    match lista with
    | [] -> 0
    | _ :: t -> 1 + length t

let length' lista =
    let rec aux acc l =
        match l with
        | [] -> acc
        | _ :: t -> aux (acc + 1) t
    in
    aux 0 lista

let compare_lengths lista1 lista2 =
    let rec aux l1 l2 =
        match (l1, l2) with
        | [], [] -> 0        
        | [], _  -> -1        
        | _, []  -> 1         
        | _ :: t1, _ :: t2 -> aux t1 t2  
    in
    aux lista1 lista2

let rec append l1 l2 = 
    match l1 with
    | [] -> l2
    | h :: t -> h :: append t l2

let rev_append l1 l2 =
    let rec aux acc l =
        match l with
        | [] -> acc
        | h :: t -> aux (h :: acc) t
    in
    aux l2 l1

let rev lista =
    let rec aux acc l =
        match l with
        | [] -> acc
        | h :: t -> aux (h :: acc) t
    in
    aux [] lista

let rev' lista =
    let rec aux acc l =
        match l with
        | [] -> acc
        | h :: t -> aux (h :: acc) t
    in
    aux [] lista

let rec concat listas =
    match listas with
    | [] -> []
    | h :: t -> append h (concat t)

let rec flatten listas =
    match listas with
    | [] -> []
    | h :: t -> append h (flatten t)

let init n f =
    if n < 0 then invalid_arg "List.init"
    else
        let rec aux acc i =
            if i < 0 then acc
            else aux (f i :: acc) (i - 1)
        in
        aux [] (n - 1) |> rev

let nth lista n =
    if n < 0 then invalid_arg "List.nth"
    else
        let rec aux l i =
            match l with
            | [] -> failwith "nth"
            | h :: t -> if i = 0 then h else aux t (i - 1)
        in
        aux lista n

let rec map f lista =
    match lista with 
    | [] -> []
    | h :: t -> f h :: map f t

let rev_map f lista =
    let rec aux acc l =
        match l with
        | [] -> acc
        | h :: t -> aux (f h :: acc) t
    in
    aux [] lista

let rec map2 f l1 l2 =
    match (l1, l2) with
    | [], [] -> []
    | h1 :: t1, h2 :: t2 -> f h1 h2 :: map2 f t1 t2
    | _ -> invalid_arg "List.map2"

let rec combine l1 l2 =
    match (l1, l2) with
    | [], [] -> []
    | h1 :: t1, h2 :: t2 -> (h1, h2) :: combine t1 t2
    | _ -> invalid_arg "List.combine"

let rec split lista =
    match lista with
    | [] -> ([], [])
    | (a, b) :: t -> 
        let (l1, l2) = split t in
        (a :: l1, b :: l2)

let rec find pred lista =
    match lista with
    | [] -> raise Not_found
    | h :: t -> if pred h then h else find pred t

let rec filter pred lista =
    match lista with
    | [] -> []
    | h :: t -> if pred h then h :: filter pred t else filter pred t

let filter' pred lista =
    let rec aux acc l =
        match l with
        | [] -> rev acc
        | h :: t -> if pred h then aux (h :: acc) t else aux acc t
    in
    aux [] lista

let rec partition pred lista =
    match lista with
    | [] -> ([], [])
    | h :: t -> 
        let (yes, no) = partition pred t in
        if pred h then (h :: yes, no) else (yes, h :: no)

let partition' pred lista =
    let rec aux acc_yes acc_no l =
        match l with
        | [] -> (rev acc_yes, rev acc_no)
        | h :: t -> 
            if pred h then aux (h :: acc_yes) acc_no t
            else aux acc_yes (h :: acc_no) t
    in
    aux [] [] lista

let rec for_all pred lista =
    match lista with
    | [] -> true
    | h :: t -> pred h && for_all pred t

let rec exists pred lista =
    match lista with
    | [] -> false
    | h :: t -> pred h || exists pred t

let rec mem x lista =
    match lista with
    | [] -> false
    | h :: t -> h = x || mem x t

let rec take n lista =
    if n <= 0 then []
    else
        match lista with
        | [] -> []
        | h :: t -> h :: take (n - 1) t

let rec drop n lista =
    if n <= 0 then lista
    else
        match lista with
        | [] -> []
        | _ :: t -> drop (n - 1) t

let rec fold_left f acc lista =
    match lista with
    | [] -> acc
    | h :: t -> fold_left f (f acc h) t

let rec fold_right f lista acc =
    match lista with
    | [] -> acc
    | h :: t -> f h (fold_right f t acc)
