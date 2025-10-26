let f n = 
  if n mod 2 = 0 then n / 2 
  else 3 * n + 1

let rec length_and_top n =
  if n = 1 then (1, 1)
  else
    let (len_next, max_next) = length_and_top (f n) in
    (len_next + 1, if n > max_next then n else max_next)