let pi = 2.0 *. asin (1.0);;

let e = exp(1.0);;

let max_int_f = float_of_int max_int;;

let perimeter = function r -> 2.0 *. r *. pi;;  

let area = function r -> pi *. r *. r;;

let next_char = function c -> char_of_int(int_of_char c + 1);;

let abs_f = function n -> abs_float (n);;

let odd = function n -> if (n mod 2 = 0) then false else true;;

let next_5_mult = function n -> ((n/5) +1)*5;;

let is_letter = function n -> if ((n >= 'a' && n <= 'z') || n >= 'A' && n <= 'Z') then true else false;;

let string_of_bool = function n -> if n then "verdadero" else "false";;