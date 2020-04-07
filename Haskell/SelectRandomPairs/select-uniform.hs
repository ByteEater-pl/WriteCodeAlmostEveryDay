import System.Random
main = select "abcdefgh" 9 >>= print

select l n = do
  let rnd = randomRs (0, length l - 1) <$> newStdGen
  ix <- zip <$> rnd <*> rnd
  pure $ take n $
	  [(l!!i,l!!j) | (i,j) <- ix, i<j]
