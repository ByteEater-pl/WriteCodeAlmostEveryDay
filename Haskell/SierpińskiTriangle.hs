main = putStr $ sierpiński 9

pascal =
  iterate
    (\r@(h:t) ->
      h : zipWith (/=) t r ++ [h])
    [True]

sierpiński n =
  unlines $
  take n [
    [if e then '█' else ' '
    | e <- r]
  | r <- pascal]
