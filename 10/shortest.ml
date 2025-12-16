type move = North | South | West | East

let delta = function
  | North -> (-1, 0)
  | South -> (1, 0)
  | East  -> (0, 1)
  | West  -> (0, -1)

let opposite = function
  | North -> South | South -> North
  | East  -> West  | West  -> East

let next_pos (r, c) mv =
  let dr, dc = delta mv in
  (r + dr, c + dc)

let move_robot m n (pos, dir) =
  let new_pos = next_pos pos dir in
  if fst new_pos >= 1 && fst new_pos <= m &&
     snd new_pos >= 1 && snd new_pos <= n
  then (new_pos, dir)
  else (next_pos pos (opposite dir), opposite dir)

let shortest m n init_robots =
  let goal = (m, n) in
  let moves = [North; South; East; West] in

  let q = Queue.create () in
  let visited = Hashtbl.create 20000 in

  Queue.push ((1,1), init_robots, []) q;
  Hashtbl.add visited ((1,1), init_robots) ();

  let rec loop () =
    let pos, robots, path = Queue.pop q in
    if pos = goal then path
    else
      let next_robots = List.map (move_robot m n) robots in
      List.iter (fun mv ->
        let np = next_pos pos mv in
        if fst np >= 1 && fst np <= m && snd np >= 1 && snd np <= n then
          let occupied = List.exists (fun (rp,_) -> rp = np) next_robots in
          if not occupied then
            let state = (np, next_robots) in
            if not (Hashtbl.mem visited state) then begin
              Hashtbl.add visited state ();
              Queue.push (np, next_robots, path @ [mv]) q
            end
      ) moves;
      loop ()
  in
  loop ()
