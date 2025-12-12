Ejercicio teoría árboles

type 'a bin_tree =
	E
       |N of 'a * 'a bin_tree * 'a bin_tree
       
let lf x = N (x, E, E);;

let rec num_nodes = function
	E -> 
       |N (_, l, r) -> 1 + num_nodes l + num_nodes r
       
let rec height = function
	E -> 0
       |N (_, l, r) -> 1 + max (height l) (height r)
       
let rec preorder = function
	E -> []
       |N (x, l, r) -> (x :: preorder l) @ (preorder r)
       
let rec leaves = function
	E -> []
       |N (x, E, E) -> [x]
       |N (_, l, r) -> leaves l @ leaves r
       

type 'a st_tree =
	Leaf of 'a
       |None of 'a * 'a st_tree * 's st_tree
       
let lf x = Leaf x;;
       
let rec mirror = function
	Leaf x -> Leaf x
       |None (x, l, r) -> Node (x, mirror r, mirror l)
       
type 'a g_tree =
	Gt of 'a * 'a g_tree list
	
let lf x = Gt (x, [])

let rec num_nodes = function
	Gt (_, []) -> 1
       |Gt (_, l) -> 
         List.fold_left (+) 1 (List.map num_nodes l)
         
let rec num_nodes Gt (_, l) =  
         List.fold_left (+) 1 (List.map num_nodes l)
        
let rec num_nodes = function
	Gt (_, []) -> 1
       |Gt (_, h::t) -> 
         num_nodes h + num_nodes (Gt(x, t))
         
