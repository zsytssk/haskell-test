module Lib (someFunc) where

import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

someFunc = take 5 [1, 2, 3, 4, 5]

data Tree a = Leaf | Node (Tree a) a (Tree a)

cut :: Integer -> Tree a -> Tree a
cut 0 tree = null

inv_tup_tree :: Tree (Integer, Integer)
inv_tup_tree = inv_tup_tree_fn (0, 0)

inv_tup_tree_fn :: (Integer, Integer) -> Tree (Integer, Integer)
inv_tup_tree_fn (a, b) = Node (inv_tup_tree_fn (a + 1, b)) (a, b) (inv_tup_tree_fn (a, b + 1))