let is_prime n =
  let rec check_from i =
    i >= n || (n mod i <> 0 && check_from (i+1))
  in n > 1 && check_from 2

let is_prime2 n =
  if n <= 1 then false
  else if n <= 3 then true
  else if n mod 2 = 0 || n mod 3 = 0 then false
  else
    let rec check_from i =
      i * i > n || (n mod i <> 0 && n mod (i + 2) <> 0 && check_from (i + 6))
    in
    check_from 5


let goldbach n =
  let goldbach n =
  if n <= 2 || n mod 2 <> 0 then
    failwith "goldbach: el argumento debe ser un entero par mayor que 2"
  else
    let rec find_pair p1 =
      if p1 > n / 2 then
        failwith "goldbach: no se encontró par de primos (esto no debería ocurrir)"
      else
        let p2 = n - p1 in
        if is_prime2 p1 && is_prime2 p2 then (p1, p2)
        else find_pair (p1 + 1)
    in
    find_pair 2
  in
  if n <= 2 || n mod 2 <> 0 then
    failwith "El número debe ser par y mayor que 2"
  else
    find 2
