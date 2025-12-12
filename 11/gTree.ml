type 'a g_tree =
    Gt of 'a * 'a g_tree list

type 'a t = 'a g_tree

let leaf_tree x = Gt (x, [])

let root (Gt (x, _)) = x

let branches (Gt (_, br)) = br

let rec size t =
  match t with
  | Gt (_, br) -> 1 + List.fold_left (fun acc x -> acc + size x) 0 br

let rec height t =
  match t with
  | Gt (_, []) -> 1
  | Gt (_, br) -> 1 + List.fold_left (fun acc x -> max acc (height x)) 0 br

let rec preorder t =
  match t with
  | Gt (x, br) -> x :: List.flatten (List.map preorder br)

let rec postorder t =
  match t with
  | Gt (x, []) -> [x]
  | Gt (x, br) -> List.flatten (List.map postorder br) @ [x]

let breadth t =
  let q = Queue.create () in
  Queue.push t q;
  let rec aux acc =
    if Queue.is_empty q then List.rev acc
    else
      let Gt (x, br) = Queue.pop q in
      List.iter (fun st -> Queue.push st q) br;
      aux (x :: acc)
  in
  aux []

let rec leaves t =
  match t with
  | Gt (x, []) -> [x]
  | Gt (_, br) -> List.flatten (List.map leaves br)

let find_in_depth p t =
  let rec aux = function
    | Gt (x, br) ->
        if p x then x
        else
          let rec search_branches = function
            | [] -> raise Not_found
            | h :: tl -> try aux h with Not_found -> search_branches tl
          in
          search_branches br
  in
  aux t

let breadth_find p t =
  let q = Queue.create () in
  Queue.push t q;
  let rec aux () =
    if Queue.is_empty q then raise Not_found
    else
      let Gt (x, br) = Queue.pop q in
      if p x then x
      else (List.iter (fun st -> Queue.push st q) br; aux ())
  in aux ()

let exists p t =
  try ignore (find_in_depth p t); true
  with Not_found -> false

let for_all p t =
  not (exists (fun x -> not (p x)) t)

let rec map f t =
  match t with
  | Gt (x, br) -> Gt (f x, List.map (map f) br)

let rec mirror t =
  match t with
  | Gt (x, br) -> Gt (x, List.rev (List.map mirror br))

let rec from_bin bt =
  try
    let x = BinTree.root bt in
    if BinTree.height bt = 1 then leaf_tree x
    else
      let l = BinTree.left_branch bt in
      let r = BinTree.right_branch bt in
      Gt (x, [from_bin l; from_bin r])
  with _ -> failwith "from_bin"

let rec from_st_bin sbt =
  try
    let x = StBinTree.root sbt in
    if StBinTree.is_leaf sbt then leaf_tree x
    else
      let l = StBinTree.left_branch sbt in
      let r = StBinTree.right_branch sbt in
      Gt (x, [from_st_bin l; from_st_bin r])
  with _ -> failwith "from_bin"
