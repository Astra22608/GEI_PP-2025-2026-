type move = North | South | West | East 

let move_position (row, col) direction =
  match direction with
  | North -> (row - 1, col)
  | South -> (row + 1, col)
  | East -> (row, col + 1)
  | West -> (row, col - 1)

let is_valid_position (row, col) m n =
  row >= 1 && row <= m && col >= 1 && col <= n

let move_robot (row, col) direction m n =
  let (new_row, new_col) = move_position (row, col) direction in
  if is_valid_position (new_row, new_col) m n then
    ((new_row, new_col), direction)
  else
    let new_direction = match direction with
      | North -> South
      | South -> North
      | East -> West
      | West -> East
    in
    ((row, col), new_direction)

let step_robots robots m n =
  List.map (fun (pos, dir) -> move_robot pos dir m n) robots

let robot_positions robots =
  List.map fst robots

let has_robot pos robots =
  List.mem pos (robot_positions robots)

let shortest m n robots =
  let rec bfs queue visited =
    match queue with
    | [] -> raise Not_found
    | (current_pos, current_robots, moves) :: rest ->
        if current_pos = (m, n) then
          List.rev moves
        else
          let state = (current_pos, current_robots) in
          if List.mem state visited then
            bfs rest visited
          else
            let new_visited = state :: visited in
            let directions = [North; South; East; West] in
            let next_states = List.filter_map (fun dir ->
              let next_pos = move_position current_pos dir in
              if is_valid_position next_pos m n then begin
                let next_robots = step_robots current_robots m n in
                if not (has_robot next_pos next_robots) then
                  Some (next_pos, next_robots, dir :: moves)
                else
                  None
              end else
                None
            ) directions in
            bfs (rest @ next_states) new_visited
  in
  
  if has_robot (1, 1) robots then
    raise Not_found
  else
    bfs [((1, 1), robots, [])] []
