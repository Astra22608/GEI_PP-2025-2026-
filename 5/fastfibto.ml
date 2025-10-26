let fib n =
  let rec aux a b i =
    if i = n then a
    else aux b (a + b) (i + 1)
  in
  if n <= 2 then 1 else aux 1 1 2
  
let rec fib_string_aux i n acc =
  let f = fib i in
  if f >= n then acc
  else
    let sep = if acc = "" then "" else ", " in
    fib_string_aux (i + 1) n (acc ^ sep ^ string_of_int f)

let fib_string n = fib_string_aux 1 n ""

let () =
  if Array.length Sys.argv <> 2 then
    print_endline "fibto: Invalid number of arguments"
  else
    let n = int_of_string Sys.argv.(1) in
    print_endline (fib_string n)
