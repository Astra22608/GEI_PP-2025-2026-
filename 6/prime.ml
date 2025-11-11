let is_prime n =
  let rec check_from i =
    i >= n || (n mod i <> 0 && check_from (i+1))
  in n > 1 && check_from 2

let is_prime2 n =
  if n <= 1 then false
  else if n <= 3 then true
  else if n mod 2 = 0 || n mod 3 = 0 then false
  else
    let rec check i =
      i * i > n || (n mod i <> 0 && n mod (i + 2) <> 0 && check (i + 6))
    in check 5

let goldbach n =
  let rec find_pair i =
    if i > n / 2 then
      failwith "No se encontraron dos primos (no debería ocurrir)"
    else if is_prime2 i && is_prime2 (n - i) then
      (i, n - i)
    else
      find_pair (i + (if i = 2 then 1 else 2))  (* Salta números pares después de 2 *)
  in
  find_pair 2