type 'a st_bin_tree =
    Leaf of 'a
  | Node of 'a st_bin_tree * 'a * 'a st_bin_tree

type 'a t = 'a st_bin_tree

let leaf_tree x = Leaf x

let is_leaf t =
  match t with
  | Leaf _ -> true
  | Node _ -> false

let comb x l r = Node (l, x, r)

let root t =
  match t with
  | Leaf x -> x
  | Node (_, x, _) -> x

let left_branch t =
  match t with
  | Leaf _ -> raise Not_found
  | Node (l, _, _) -> l

let right_branch t =
  match t with
  | Leaf _ -> raise Not_found
  | Node (_, _, r) -> r

let rec size t =
  match t with
  | Leaf _ -> 1
  | Node (l, _, r) -> 1 + size l + size r

let rec height t =
  match t with
  | Leaf _ -> 1
  | Node (l, _, r) -> 1 + max (height l) (height r)

let rec preorder t =
  match t with
  | Leaf x -> [x]
  | Node (l, x, r) -> x :: (preorder l @ preorder r)

let rec inorder t =
  match t with
  | Leaf x -> [x]
  | Node (l, x, r) -> inorder l @ [x] @ inorder r

let rec postorder t =
  match t with
  | Leaf x -> [x]
  | Node (l, _, r) -> postorder l @ postorder r @ [ root t ]

let breadth t =
  let q = Queue.create () in
  let rec aux acc =
    if Queue.is_empty q then List.rev acc
    else match Queue.pop q with
      | Leaf x ->
          aux (x :: acc)
      | Node (l, x, r) ->
          Queue.push l q;
          Queue.push r q;
          aux (x :: acc)
  in
  Queue.push t q;
  aux []

let rec leaves t =
  match t with
  | Leaf x -> [x]
  | Node (l, _, r) -> leaves l @ leaves r

let find_in_depth p t =
  let rec aux = function
    | Leaf x -> if p x then x else raise Not_found
    | Node (l, x, r) ->
        if p x then x
        else try aux l with Not_found -> aux r
  in aux t

let exists p t =
  try ignore (find_in_depth p t); true
  with Not_found -> false

let for_all p t =
  not (exists (fun x -> not (p x)) t)

let rec map f t =
  match t with
  | Leaf x -> Leaf (f x)
  | Node (l, x, r) -> Node (map f l, f x, map f r)

let mirror t =
  let rec m = function
    | Leaf x -> Leaf x
    | Node (l, x, r) -> Node (m r, x, m l)
  in m t

let to_bin t =
  let rec convert st =
    if is_leaf st then BinTree.leaf_tree (root st)
    else BinTree.comb (root st) (convert (left_branch st)) (convert (right_branch st))
  in convert t

let from_bin bt =
  if bt = (try BinTree.comb (BinTree.root bt) (BinTree.left_branch bt) (BinTree.right_branch bt)
           with _ -> BinTree.leaf_tree (BinTree.root bt))
  then
    let rec convert b =
      if BinTree.height b = 1 then leaf_tree (BinTree.root b)
      else
        let l = BinTree.left_branch b in
        let r = BinTree.right_branch b in
        if l = b || r = b then failwith "from_bin"
        else comb (BinTree.root b) (convert l) (convert r)
    in convert bt
  else failwith "from_bin"
