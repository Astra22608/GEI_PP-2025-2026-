let mueve (ori, des) =
  let posiciones = [|"   "; "---"; "-->"; "<--"|] in
  let pos1, pos2, pos3 =
    if ori = 1 && des = 2 then (1, 2, 0)
    else if ori = 2 && des = 1 then (3, 1, 0)
    else if ori = 1 && des = 3 then (1, 0, 2)
    else if ori = 3 && des = 1 then (3, 0, 1)
    else if ori = 2 && des = 3 then (0, 1, 2)
    else (* ori = 3 && des = 2 *) (0, 3, 1)
  in
  "1" ^ posiciones.(pos1) ^ "2" ^ posiciones.(pos2) ^ "3\n"

let otro ori des =
  6 - ori - des

let rec hanoi n ori des =
  (* n número de discos, 1 <= ori <= 3, 1 <= dest <= 3, ori <> des *)
  if n = 0 then ""
  else
    let otro = otro ori des in
    hanoi (n-1) ori otro ^ mueve (ori, des) ^ hanoi (n-1) otro des

let hanoi n ori des =
  if n = 0 || ori = des then ""
  else hanoi n ori des

let print_hanoi n ori des =
  if n < 0 || ori < 1 || ori > 3 || des < 1 || des > 3
  then print_endline "**ERROR**"
  else print_endline ("=========\n" ^
                      hanoi n ori des ^
                      "=========")

let n_hanoi_mov n nd ori des =
  if n < 0 || nd > Sys.int_size || ori = des then (ori, des)
  else
    let aux = 6 - ori - des in
    let m = 2^(nd-1) - 1 in 
    if n <= m then
      n_hanoi_mov n (nd - 1) ori aux
    else if n = m + 1 then
      (ori, des)
    else
      n_hanoi_mov (n - m - 1) (nd - 1) aux des

let crono f x =
  let t = Sys.time () in
  f x; Sys.time () -. t
