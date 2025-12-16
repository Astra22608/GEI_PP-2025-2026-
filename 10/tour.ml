type move = North | South | West | East

let delta = function
  | North -> (-1, 0)
  | South -> (1, 0)
  | East  -> (0, 1)
  | West  -> (0, -1)

let opposite = function
  | North -> South | South -> North
  | East  -> West  | West  -> East

let add (r, c) mv =
  let dr, dc = delta mv in
  (r + dr, c + dc)

let move_robot m n (pos, dir) =
  let new_pos = add pos dir in
  let nr, nc = new_pos in
  if 1 <= nr && nr <= m && 1 <= nc && nc <= n then
    (new_pos, dir)
  else
    (add pos (opposite dir), opposite dir)

let occupied pos robots =
  List.exists (fun (p, _) -> p = pos) robots

let tour m n initial_robots =
  let goal = (m, n) in
  let moves = [North; South; East; West] in

  let rec search pos visited robots path =
    if pos = goal then
      List.rev path
    else
      let rec try_moves = function
        | [] -> raise Not_found
        | mv :: rest ->
            let next_pos = add pos mv in
            let r, c = next_pos in
            if r < 1 || r > m || c < 1 || c > n || List.mem next_pos visited then
              try_moves rest
            else
              let next_robots = List.map (move_robot m n) robots in
              if occupied next_pos next_robots then
                try_moves rest
              else
                (try
                   search next_pos (next_pos :: visited) next_robots (mv :: path)
                 with Not_found ->
                   try_moves rest)
      in
      try_moves moves
  in
  search (1,1) [(1,1)] initial_robots []
