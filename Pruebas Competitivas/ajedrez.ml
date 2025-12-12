type piece =
  | King | Queen | Rook | Bishop | Knight | Pawn

type pos = int * int
type piece_with_pos = piece * pos
type move = pos * pos
type board = piece_with_pos list

let col_to_index c = Char.code c - Char.code 'a'
let row_to_index c = Char.code c - Char.code '1'
let index_to_col i = Char.chr (i + Char.code 'a')
let index_to_row i = Char.chr (i + Char.code '1')

let pos_to_string (x,y) =
  String.make 1 (index_to_col x) ^ String.make 1 (index_to_row y)

let parse_input input =
  let len = String.length input in
  if len mod 3 <> 0 then failwith "bad input length";
  let rec aux acc i =
    if i >= len then List.rev acc else
    let p = input.[i]
    and c = input.[i+1]
    and r = input.[i+2] in
    let piece =
      match p with
      | 'r' -> King | 'd' -> Queen | 't' -> Rook
      | 'a' -> Bishop | 'c' -> Knight | 'p' -> Pawn
      | _ -> failwith "bad piece"
    in
    let x = col_to_index c and y = row_to_index r in
    if x<0 || x>7 || y<0 || y>7 then failwith "bad coord";
    aux ((piece,(x,y))::acc) (i+3)
  in aux [] 0

let occupied board (x,y) =
  List.exists (fun (_, (px,py)) -> px = x && py = y) board

let moves_in_direction (x,y) (dx,dy) board =
  let rec walk nx ny =
    if nx<0 || nx>7 || ny<0 || ny>7 then [] else
    if occupied board (nx,ny) then [((x,y),(nx,ny))] else
    walk (nx+dx) (ny+dy)
  in walk (x+dx) (y+dy)

let piece_moves piece (x,y) board =
  match piece with
  | Pawn ->
      let dirs = [(-1,1); (1,1)] in
      List.fold_left (fun acc (dx,dy) ->
        let nx,ny = x+dx, y+dy in
        if nx>=0 && nx<8 && ny>=0 && ny<8 && occupied board (nx,ny)
        then ((x,y),(nx,ny)) :: acc else acc
      ) [] dirs

  | Knight ->
      let offs = [
        (-2,-1);(-2,1);(-1,-2);(-1,2);
        (1,-2);(1,2);(2,-1);(2,1)
      ] in
      List.fold_left (fun acc (dx,dy) ->
        let nx,ny = x+dx, y+dy in
        if nx>=0 && nx<8 && ny>=0 && ny<8 && occupied board (nx,ny)
        then ((x,y),(nx,ny))::acc else acc
      ) [] offs

  | Bishop ->
      let dirs = [(-1,-1);(-1,1);(1,-1);(1,1)] in
      List.concat (List.map (fun d -> moves_in_direction (x,y) d board) dirs)

  | Rook ->
      let dirs = [(-1,0);(1,0);(0,-1);(0,1)] in
      List.concat (List.map (fun d -> moves_in_direction (x,y) d board) dirs)

  | Queen ->
      let dirs = [
        (-1,-1);(-1,0);(-1,1);
        (0,-1);(0,1);
        (1,-1);(1,0);(1,1)
      ] in
      List.concat (List.map (fun d -> moves_in_direction (x,y) d board) dirs)

  | King ->
      let dirs = [
        (-1,-1);(-1,0);(-1,1);
        (0,-1);(0,1);
        (1,-1);(1,0);(1,1)
      ] in
      List.fold_left (fun acc (dx,dy) ->
        let nx,ny = x+dx,y+dy in
        if nx>=0 && nx<8 && ny>=0 && ny<8 && occupied board (nx,ny)
        then ((x,y),(nx,ny))::acc else acc
      ) [] dirs

(* ORDEN DEL JUEZ:
   - si hubo jugada previa, primero movimientos cuya fuente = última fuente
   - luego el resto *)
let all_moves_prioritized board last_from =
  let all =
    List.concat (List.map (fun (p,pos) -> piece_moves p pos board) board)
  in
  match last_from with
  | None ->
      all
  | Some (lx,ly) ->
      let preferred, rest =
        List.partition (fun ((fx,fy),_) -> fx = lx && fy = ly) all
      in
      preferred @ rest

let apply_move board ((fx,fy),(tx,ty)) =
  let piece = fst (List.find (fun (_, (x,y)) -> x=fx && y=fy) board) in
  let filtered =
    List.filter (fun (_, (x,y)) ->
      not ((x=fx && y=fy) || (x=tx && y=ty))
    ) board
  in
  (piece,(tx,ty)) :: filtered

let solve board =
  let visited = Hashtbl.create 50000 in
  let solution = ref None in

  let key b =
    let s =
      List.map (fun (p,(x,y)) ->
        Printf.sprintf "%d%d%d"
          (match p with King->0|Queen->1|Rook->2|Bishop->3|Knight->4|Pawn->5)
          x y
      ) b
    in String.concat ";" (List.sort String.compare s)
  in

  let rec dfs board path last_from =
    if !solution <> None then () else
    if List.length board = 1 then solution := Some (List.rev path) else
    let k = key board in
    if Hashtbl.mem visited k then () else (
      Hashtbl.add visited k true;

      let moves = all_moves_prioritized board last_from in

      List.iter (fun mv ->
        if !solution = None then
          let new_board = apply_move board mv in
          let (from_pos,_) = mv in
          dfs new_board (mv::path) (Some from_pos)
      ) moves
    )
  in
  dfs board [] None;
  match !solution with Some s -> s | None -> []

let format_solution moves =
  String.concat " "
    (List.map (fun ((fx,fy),(tx,ty)) ->
       pos_to_string (fx,fy) ^ pos_to_string (tx,ty)
    ) moves)

let () =
  try
    if Array.length Sys.argv > 1 then (
      let board = parse_input Sys.argv.(1) in
      let sol = solve board in
      if sol = [] then print_endline "imposible"
      else print_endline (format_solution sol)
    )
  with _ -> print_endline "imposible"
