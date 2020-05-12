fill := [ :heights || a rmax s |
  a := 0.
  rmax := (heights reverse
      collect: [ :h | a := h max: a ])
    reverse.
  s := 0.
  a := 0.
  heights doWithIndex: [ :h :i |
    a := h max: a.
    s := s + (a min: (rmax at: i)) - h.
  ].
  s
]
(fill value: #(2 5 1 2 3 4 7 7 6)) print
