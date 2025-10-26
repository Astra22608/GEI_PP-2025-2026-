let curry f x y = f (x, y)

let uncurry f (x, y) = f x y

let comp f g x = f (g x)

let i x = x

let j (x, y) = x

let k (x, y) = y

let l x = [x]
