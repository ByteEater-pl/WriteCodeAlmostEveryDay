import CodeWorld
main = drawingOf $ dilated 5 $ dragon 13

dragon 0 = polyline [(0,0),(0,1)]
dragon n =
  rotated (pi/4) part &
  translated 0 1 $ rotated (pi*3/4) part
  where part = dilated (sqrt 0.5) $ dragon (n-1)
