import CodeWorld

main = drawingOf $ regularPolygon 5 6

regularPolygon n side = dilated side $ part n where
  part k =
    if k > 0
    then
      polyline [(0,0),(1,0)] &
        translated 1 0 $
        rotated (2*pi/n) $
        part (k-1)
    else blank
