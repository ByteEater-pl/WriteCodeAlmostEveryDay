-- These functions aren't in base. I think they should be.

unsnoc :: [a] -> Maybe ([a], a)
unsnoc [] = Nothing
unsnoc [x] = Just ([], x)
unsnoc (x:xs) = Just (x:l, y) where Just (l,y) = unsnoc xs

spans :: [a] -> [([a], [a])]
spans [] = [([],[])]
spans l@(x:xs) = ([], l) : [(x:as, zs) | (as,zs) <- spans xs]

-- A more general type is inferred for this one: (Alternative m, Control.Monad.Fail.MonadFail m) => [a] -> m ([a], a). So I wonder what else it might be useful for.
unsnoc' xs = do
  (h:t) <- pure xs
  guard (null t) $> ([], h) <|> do
    (l,y) <- unsnoc' t
    pure (h:l, y)
{-
Requires Data.Functor, Control.Applicative and Control.Monad, although the first can be avoided by switching from $> to <$ (oddly, they're in different modules) or desugaring it to do (creating another nesting level of dos), and the second by replacing <|> with `mplus`.

Only the outermost do in the above requires using the Monad instance for Maybe, as it handles failure. The latter and the possible discussed third in the middle would work with just ApplicativeDo.
-}
