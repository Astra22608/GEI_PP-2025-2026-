
(* Escenario A (5 x 5 con 10 robots) *)
tour 5 5
  [((1, 3), East); ((1, 4), East); ((2, 3), North); ((2, 5), East);
   ((3, 5), North); ((4, 1), East); ((4, 2), West); ((4, 3), East);
   ((5, 3), West); ((5, 5), East)];;

(* Escenario B (6 x 8 con 25 robots) *)
tour 6 8
  [((1, 2), East); ((1, 4), South); ((1, 5), East); ((1, 8), East);
   ((2, 3), South); ((2, 4), South); ((2, 8), East); ((3, 1), South);
   ((3, 2), East); ((3, 3), East); ((3, 4), East); ((3, 7), North);
   ((3, 8), East); ((4, 1), East); ((4, 2), West); ((4, 3), North);
   ((4, 5), South); ((4, 6), North); ((4, 7), West); ((5, 1), South);
   ((5, 4), North); ((5, 8), East); ((6, 2), North); ((6, 3), West);
   ((6, 5), East)];;

(* Escenario C (8 x 12 con 50 robots) *)
tour 8 12
  [((1, 2), West); ((1, 4), West); ((1, 5), East); ((1, 6), North);
   ((1, 8), East); ((1, 9), West); ((1, 11), North); ((1, 12), West);
   ((2, 1), North); ((2, 4), North); ((2, 7), East); ((2, 8), South);
   ((2, 9), East); ((2, 10), North); ((3, 2), North); ((3, 3), South);
   ((3, 4), East); ((3, 8), South); ((3, 10), East); ((3, 11), South);
   ((4, 3), East); ((4, 5), North); ((4, 7), East); ((4, 9), North);
   ((4, 11), South); ((5, 3), South); ((5, 5), East); ((5, 6), South);
   ((5, 7), West); ((5, 10), North); ((6, 3), East); ((6, 5), North);
   ((6, 6), South); ((6, 7), North); ((6, 8), North); ((6, 10), South);
   ((6, 11), West); ((6, 12), West); ((7, 1), East); ((7, 2), North);
   ((7, 3), South); ((7, 5), South); ((7, 8), South); ((7, 10), East);
   ((7, 12), West); ((8, 3), North); ((8, 9), North); ((8, 10), West);
   ((8, 11), West); ((8, 12), South)];;

(* Escenario D (10 x 15 con 80 robots) *)
tour 10 15
  [((1, 3), North); ((1, 4), North); ((1, 7), South); ((1, 8), South);
   ((1, 11), South); ((1, 12), East); ((1, 14), West); ((1, 15), West);
   ((2, 4), North); ((2, 7), South); ((2, 9), East); ((2, 10), South);
   ((2, 14), North); ((2, 15), North); ((3, 4), South); ((3, 6), South);
   ((3, 11), East); ((3, 12), West); ((3, 14), West); ((4, 3), West);
   ((4, 4), North); ((4, 5), West); ((4, 6), South); ((4, 8), North);
   ((4, 10), South); ((4, 11), South); ((4, 12), East); ((4, 14), East);
   ((4, 15), East); ((5, 1), West); ((5, 2), West); ((5, 3), East);
   ((5, 5), South); ((5, 6), East); ((5, 9), East); ((5, 11), South);
   ((5, 12), East); ((5, 14), South); ((5, 15), North); ((6, 2), West);
   ((6, 3), East); ((6, 4), East); ((6, 6), North); ((6, 9), East);
   ((6, 10), East); ((6, 11), East); ((6, 12), East); ((6, 13), East);
   ((6, 15), South); ((7, 1), North); ((7, 12), North); ((7, 13), South);
   ((7, 15), North); ((8, 1), South); ((8, 2), East); ((8, 4), East);
   ((8, 5), East); ((8, 6), South); ((8, 7), East); ((8, 9), East);
   ((8, 10), East); ((8, 14), West); ((8, 15), East); ((9, 1), South);
   ((9, 2), North); ((9, 3), West); ((9, 6), West); ((9, 9), East);
   ((9, 11), South); ((9, 14), North); ((9, 15), East); ((10, 1), West);
   ((10, 2), South); ((10, 9), North); ((10, 10), West); ((10, 11), South);
   ((10, 12), North); ((10, 13), North); ((10, 14), South); ((10, 15), South)];;

