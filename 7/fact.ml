let fact n =
  if n < 0 then
    raise (Invalid_argument "fact")
  else
    let rec aux m =
      if m = 0 then 1 
      else m * aux (m-1)
    in
    aux n