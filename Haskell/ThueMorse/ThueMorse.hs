import Data.Function
main = print $ take 9 <$>
  [seqThueMorse, seqThueMorse2, seqThueMorse3]

seqThueMorse = fix $ (0:).tail.(>>= \x->[x,1-x])

seqThueMorse2 =
  [iterate (\l -> l ++ ((1-) <$> l)) [0]
    !!n!!n
  | n<-[0..]]

seqThueMorse3@s@(_:r) =
  0 : interleave ((1-) <$> s) r where
    interleave (h:t) b = h : interleave b t
