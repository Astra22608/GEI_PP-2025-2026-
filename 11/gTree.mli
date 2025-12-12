type 'a g_tree =
    Gt of 'a * 'a g_tree list

type 'a t = 'a g_tree

val leaf_tree : 'a -> 'a t

val root : 'a t -> 'a

val branches : 'a t -> 'a t list

val size : 'a t -> int

val height : 'a t -> int
(* altura o número de niveles; 1 si tiene solo un nodo *)

val preorder : 'a t -> 'a list

val postorder : 'a t -> 'a list

val breadth : 'a t -> 'a list

val leaves : 'a t -> 'a list

val find_in_depth : ('a -> bool) -> 'a t -> 'a

val breadth_find :  ('a -> bool) -> 'a t -> 'a

val exists : ('a -> bool) -> 'a t -> bool

val for_all : ('a -> bool) -> 'a t -> bool

val map : ('a -> 'b) -> 'a t -> 'b t

val mirror : 'a t -> 'a t

val from_bin : 'a BinTree.t -> 'a t
(* no inyectiva (no reversible) *)
(* lanza Failure "from_bin" si el árbol es vacío *)

val from_st_bin : 'a StBinTree.t -> 'a t

