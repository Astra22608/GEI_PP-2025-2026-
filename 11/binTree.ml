type 'a t =
    Empty
  | Node of 'a * 'a t * 'a t

let empty = Empty

let is_empty = function Empty -> true | _ -> false

let leaf_tree x = Node (x, Empty, Empty)

let comb x l r = Node (x, l, r)

let root = function
    Empty -> failwith "root"
  | Node (x, _, _) -> x

let left_branch = function
    Empty -> failwith "left_branch"
  | Node (_, l, _) -> l

let right_branch = function
    Empty -> failwith "right_branch"
  | Node (_, _, r) -> r

let rec size = function
    Empty -> 0
  | Node (_, l, r) -> 1 + size l + size r

let rec height = function
    Empty -> 0
  | Node (_, l, r) -> 1 + max (height l) (height r)

let rec preorder = function
    Empty -> []
  | Node (x, l, r) -> x :: (preorder l @ preorder r)

let rec inorder = function
    Empty -> []
  | Node (x, l, r) -> inorder l @ [x] @ inorder r

let rec postorder = function
    Empty -> []
  | Node (x, l, r) -> postorder l @ postorder r @ [x]

let breadth t =
  let rec aux queue acc =
    match queue with
    | [] -> List.rev acc
    | Empty :: rest -> aux rest acc
    | Node (x, l, r) :: rest -> aux (rest @ [l; r]) (x :: acc)
  in
  aux [t] []

let rec leaves = function
    Empty -> []
  | Node (x, Empty, Empty) -> [x]
  | Node (_, l, r) -> leaves l @ leaves r

let rec find_in_depth pred = function
    Empty -> raise Not_found
  | Node (x, l, r) ->
      if pred x then x
      else
        try find_in_depth pred l
        with Not_found -> find_in_depth pred r

let rec exists pred = function
    Empty -> false
  | Node (x, l, r) ->
      pred x || exists pred l || exists pred r

let rec for_all pred = function
    Empty -> true
  | Node (x, l, r) ->
      pred x && for_all pred l && for_all pred r

let rec map f = function
    Empty -> Empty
  | Node (x, l, r) -> Node (f x, map f l, map f r)

let rec mirror = function
    Empty -> Empty
  | Node (x, l, r) -> Node (x, mirror r, mirror l)
