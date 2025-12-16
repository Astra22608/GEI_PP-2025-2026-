open BinTree

type 'a a_tree = 'a option array
type 'a t = 'a a_tree

let from_bin (bt : 'a BinTree.t) : 'a option array =
  let h = height bt in
  let size = (1 lsl h) - 1 in
  let arr = Array.make size None in

  let rec fill i t =
    if not (is_empty t) && i < size then begin
      arr.(i) <- Some (root t);
      fill (2*i + 1) (left_branch t);
      fill (2*i + 2) (right_branch t)
    end
  in
  fill 0 bt;
  arr

let breadth (a : 'a option array) : 'a list =
  let res = ref [] in
  for i = 0 to Array.length a - 1 do
    match a.(i) with
    | Some x -> res := !res @ [x]
    | None -> ()
  done;
  !res

let mem (cmp : 'a -> 'a -> bool) (x : 'a) (a : 'a option array) : bool =
  let i = ref 0 in
  let found = ref false in
  let n = Array.length a in
  while !i < n && not !found do
    match a.(!i) with
    | None ->
        i := n   
    | Some y ->
        if y = x then
          found := true
        else if cmp x y then
          i := 2 * !i + 1
        else
          i := 2 * !i + 2
  done;
  !found
