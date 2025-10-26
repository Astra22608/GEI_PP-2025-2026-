let str3_of_int n =
  let rec aux n = 
    if n < 3 then string_of_int n
    else aux (n / 3) ^ string_of_int (n mod 3)
  in
  if n = 0 then "0" else aux n

let int_of_str3 s =
  let rec aux i p total =
    if i < 0 then total
    else 
      let d = Char.code s.[i] - 48 in (* 48 = código de '0' *)
      aux (i-1) (p*3) (total + d*p)
  in
  aux (String.length s - 1) 1 0

let strg_of_int base n =
  let rec aux n = 
    if n < base then string_of_int n
    else aux (n / base) ^ string_of_int (n mod base)
  in
  if n = 0 then "0" else aux n

let int_of_strg base s =
  let rec aux i p total =
    if i < 0 then total
    else 
      let d = Char.code s.[i] - 48 in
      aux (i-1) (p*base) (total + d*p)
  in
  aux (String.length s - 1) 1 0