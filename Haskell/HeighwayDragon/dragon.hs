import CodeWorld
main = drawingOf $ dragon 9

dragon 0 = polyline [(0,0),(0,1)]
dragon n =
  rotated (pi/4) part &
  translated 0 1 $ rotated (pi*3/4) part
  where part = dilated (sqrt 0.5) $ dragon (n-1)
