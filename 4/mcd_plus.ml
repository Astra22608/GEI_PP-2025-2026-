let mcd_pasos (a, b) =
  let rec aux x y pasos =
    if y = 0 then (x, pasos)
    else if x = 0 then (y, pasos)
    else if x >= y then aux y (x mod y) (pasos + 1)
    else aux x (y mod x) (pasos + 1)
  in
  aux a b 1
