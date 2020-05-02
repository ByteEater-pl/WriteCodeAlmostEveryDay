let sort arr lower upper =
  while lower < upper do
    let mutable i = lower
    let mutable j = i + 1
    let pivot = Array.get arr i
    while j < upper do
      let mutable t = Array.get arr j
      if t < pivot then
        Array.set arr j (Array.get arr i)
        Array.set arr i t
        i <- i + 1
    if i > lower then
      let mutable
        bounds = [|[|lower; i|]; [|i; upper|]|]
      if 2 * i <= lower + upper then
        bounds <- Array.rev bounds
      [|[|lower; upper|]|] <- bounds
      let recBounds = Array.get bounds 1
      sort arr (Array.get recBounds 0) (Array.get recBounds 1)
    else lower <- lower + 1
    j <- j + 1

let a = [|3; 1; 4; 1; 5; 9; 2; 6; 5|]
sort a
Array.map System.Console.Write a
