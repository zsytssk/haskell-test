module Lib (someFunc) where

import Debug.Trace (traceShow)

someFunc = foldtrie [(1, 1), (2, 4), (3, 9)] 5

data Trie a = Leaf a | Node a [Trie a]

foldtrie :: (b -> a -> b) -> b -> Trie a -> b
foldtrie f acc (Leaf x) = f acc x
foldtrie f acc (Node x xs) = foldl f' (f acc x) xs
  where
    f' acc t = foldtrie f acc t
