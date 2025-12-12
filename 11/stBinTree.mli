type 'a st_bin_tree =
    Leaf of 'a
  | Node of 'a st_bin_tree * 'a * 'a st_bin_tree

type 'a t = 'a st_bin_tree

val leaf_tree: 'a -> 'a t

val is_leaf: 'a t -> bool

val comb : 'a -> 'a t -> 'a t -> 'a t
(* comb x l r devuelve el árbol con raíz x, rama izquierda l y rama
   derecha r *)

val root : 'a t -> 'a

val left_branch : 'a t -> 'a t

val right_branch : 'a t -> 'a t

val size : 'a t -> int

val height : 'a t -> int
(* altura o número de niveles; 1 si tiene solo un nodo *)

val preorder : 'a t -> 'a list

val inorder : 'a t -> 'a list

val postorder : 'a t -> 'a list

val breadth : 'a t -> 'a list

val leaves : 'a t -> 'a list
(* lista de hojas de izquierda a derecha *)

val find_in_depth  : ('a -> bool) -> 'a t -> 'a
(* lanza Not_found si ningún nodo cumple el predicado *)

val exists : ('a -> bool) -> 'a t -> bool

val for_all : ('a -> bool) -> 'a t -> bool

val map : ('a -> 'b) -> 'a t -> 'b t

val mirror : 'a t-> 'a t
(* imagen especular *)

val to_bin : 'a t -> 'a BinTree.t

val from_bin : 'a BinTree.t -> 'a t
(* lanza Failure "from_bin" si el árbol es vacío o no estrictamente
   binario *)

