let curry f x y = f (x, y)

let uncurry g = fun (x, y) -> g x y

let sum (x, y) = x + y

let g x y = x + y

let h x = x + 1

let comp f g x = f (g x)

let f x = x * 2

let i x = x

let j (x, _) = x

let k (_, y) = y

let l x = [x]