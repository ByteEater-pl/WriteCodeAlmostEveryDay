import Data.Function
main = sequence_ $ print <$> take 9 <$>
  [seqThueMorse, seqThueMorse2, seqThueMorse3]

seqThueMorse = fix $ (0:).tail.(>>= \x->[x,1-x])

seqThueMorse2 =
  [iterate (\l -> l ++ [1-x | x<-l]) [0]
    !!n!!n
  | n<-[0..]]

seqThueMorse3@(_:r) =
  0:1: interleave r [1-x | x<-r] where
    interleave (h:t) b = h : interleave b t
