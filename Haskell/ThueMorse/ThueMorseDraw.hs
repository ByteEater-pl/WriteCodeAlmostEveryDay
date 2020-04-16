import CodeWorld
import Data.List
import Data.Function

trans = [[(0,1,-1,0),(0,-1,1,0)],[(-1.1,0,0,-1.1),(0,-1,1,0)]]

main = drawingOf $ pictures [
  colored (assortedColors!!i) $
  translated (fromIntegral i) 0 $
  dilated 0.2 $
  polyline $
  take 55 $
    (0,0) : snd (mapAccumL
      (\(v,d) b -> let v' = add_v2 v d in
        ((v', mul_m2x2_v (m!!b) d), v'))
      ((0,1),(0,1))
      seqThueMorse)
  | (m,i) <- zip trans [0..]]

seqThueMorse = fix $ (0:).tail.(>>= \x->[x,1-x])

add_v2 (a,b) (c,d) = (a+c,b+d)
mul_m2x2_v (a,b,c,d) (x,y) = (a*x+c*y,b*x+d*y)
