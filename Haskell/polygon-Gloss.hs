import Graphics.Gloss

main = display FullScreen white $ regularPolygon 5 60

regularPolygon n side = scale side side $ part n where
  part k =
    if k > 0
    then pictures [
      line [(0,0),(1,0)],
      translate 1 0 $
      rotate (360/n) $
      part (k-1)]
    else blank
