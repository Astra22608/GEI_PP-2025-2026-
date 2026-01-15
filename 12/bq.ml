open Queue

let breadth (tree : 'a BinTree.t) : 'a list =
  let q = new queue in

  let rec aux acc =
    match q#pop with
    | None -> List.rev acc
    | Some current ->
        if BinTree.is_empty current then
          aux acc
        else
          let value = BinTree.root current in
          let left_child = BinTree.left_branch current in
          let right_child = BinTree.right_branch current in
          
          (* Encolar solo si no están vacíos *)
          if not (BinTree.is_empty left_child) then q#push left_child;
          if not (BinTree.is_empty right_child) then q#push right_child;

          aux (value :: acc)
  in

  (* Iniciar el recorrido *)
  if not (BinTree.is_empty tree) then q#push tree;
  aux []
