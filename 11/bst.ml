let is_bst ord t =
  let rec check t min max =
    if BinTree.is_empty t then true
    else
      let v = BinTree.root t in
      (match min with None -> true | Some m -> ord m v) &&
      (match max with None -> true | Some m -> ord v m) &&
      check (BinTree.left_branch t) min (Some v) &&
      check (BinTree.right_branch t) (Some v) max
  in
  check t None None

let rec mem ord x t =
  if BinTree.is_empty t then false
  else
    let v = BinTree.root t in
    x = v ||
    (ord x v && mem ord x (BinTree.left_branch t)) ||
    (ord v x && mem ord x (BinTree.right_branch t))

let rec add ord x t =
  if BinTree.is_empty t then BinTree.leaf_tree x
  else
    let v = BinTree.root t in
    if ord x v then BinTree.comb v (add ord x (BinTree.left_branch t)) (BinTree.right_branch t)
    else if ord v x then BinTree.comb v (BinTree.left_branch t) (add ord x (BinTree.right_branch t))
    else t

let rec remove ord x t =
  if BinTree.is_empty t then t
  else
    let v = BinTree.root t in
    if ord x v then BinTree.comb v (remove ord x (BinTree.left_branch t)) (BinTree.right_branch t)
    else if ord v x then BinTree.comb v (BinTree.left_branch t) (remove ord x (BinTree.right_branch t))
    else
      let l = BinTree.left_branch t in
      let r = BinTree.right_branch t in
      if BinTree.is_empty l then r
      else if BinTree.is_empty r then l
      else
        let rec min_of t =
          if BinTree.is_empty (BinTree.left_branch t) then BinTree.root t
          else min_of (BinTree.left_branch t)
        in
        let m = min_of r in
        BinTree.comb m l (remove ord m r)
