import Data.Function
main = print $ take 9 seqThueMorse

seqThueMorse = fix $ (0:).tail.(>>= \x->[x,1-x])
