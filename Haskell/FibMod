{-# LANGUAGE
  LambdaCase,
  ViewPatterns
#-}
main = print $ fibMod 0 9

fibMod m = \case
  0 -> 0
  i -> pow [0,1,1] i !! 1 where
    pow f@(a:b:c:_) n =
      let (q, fromIntegral -> r) = divMod n 2
      in if q>0 then
        (`pow` q) $
        drop r $
        -- really (`mod` 0) should be id per mathematical definition
        [if m>0 then mod x m else x
        | x <- [
          a*a+b*b,
          (a+c)*b,
          b*b+c*c,
          (2*b+c)*c]]
      else f
