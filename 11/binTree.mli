type 'a t
(* el tipo para representar árboles binarios con nodos etiquetados con
   valores de tipo 'a *)

val empty : 'a t
(* el árbol vacío *)

val is_empty : 'a t -> bool

val leaf_tree : 'a -> 'a t
(* construye un árbol con un solo nodo (árbol hoja) *)

val comb : 'a -> 'a t -> 'a t -> 'a t
(* comb x l r construye un árbol con raiz x, rama izquierda l y rama
   derecha r *)

val root : 'a t -> 'a
(* devuelve la etiqueta o valor de la raíz;
   lanza Failure "root" si el árbol es vacío *)

val left_branch : 'a t -> 'a t
(* devuelve la rama izquierda;
   lanza Failure "left_branch" si el árbol es vacío *)

val right_branch : 'a t -> 'a t
(* devuelve la rama derecha;
   lanza Failure "right_branch" si el árbol es vacío *)

val size : 'a t -> int
(* número de nodos *)

val height : 'a t -> int
(* altura o número de niveles; 0 para el árbol vacío; 1 si tiene solo
   un nodo *)

val preorder : 'a t -> 'a list
(* primero la raíz *)

val inorder : 'a t -> 'a list
(* la raíz entre las ramas *)

val postorder : 'a t -> 'a list
(* la raíz al final *)

val breadth : 'a t -> 'a list
(* enumeración de los nodos del árbol "en anchura", es decir,
   recorrido por niveles y de izquierda a derecha *)

val leaves : 'a t -> 'a list
(* lista de hojas de izquierda a derecha *)

val find_in_depth : ('a -> bool) -> 'a t -> 'a
(* busca en profundidad (priorizando las ramas izquierdas) un nodo que
   satisfaga el predicado;
   lanza Not_found si ninguno lo satisface *)

val exists : ('a -> bool) -> 'a t -> bool

val for_all : ('a -> bool) -> 'a t -> bool

val map : ('a -> 'b) -> 'a t -> 'b t

val mirror : 'a t -> 'a t
(* imagen especular *)

