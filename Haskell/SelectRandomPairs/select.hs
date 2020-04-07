import System.Random
main = select "abcdefgh" 15 >>= print

select l n = do
  ix@(_:t) <- randomRs (0, length l - 1) <$> newStdGen
  pure $ take n $
  [(l!!i,l!!j) | (i,j) <- zip ix t, i<j]
