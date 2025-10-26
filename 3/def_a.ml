let pi = 2.0 *. asin (1.0);;

let e = exp(1.0);;

let max_int_f = float_of_int max_int;;

let perimeter r = 2.0 *. r *. pi;;  

let area r = pi *. r *. r;;

let next_char c = char_of_int(int_of_char c + 1);;

let abs_f n = abs_float (n);;

let odd n = if (n mod 2 = 0) then false else true;;

let next_5_mult n = ((n/5) +1)*5;;

let is_letter n = if ((n >= 'a' && n <= 'z') || n >= 'A' && n <= 'Z') then true else false;;

let string_of_bool n = if n then "verdadero" else "false";;