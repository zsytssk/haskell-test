module Lib (someFunc) where

import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

someFunc = cut 3 inv_tup_tree

data Tree a = Leaf | Node (Tree a) a (Tree a)
  deriving (Show)

cut :: Integer -> Tree a -> Tree a
cut 0 tree = Leaf
cut n Leaf = Leaf
cut n (Node l v r) = Node (cut (n - 1) l) v (cut (n -1) r)

inv_tup_tree :: Tree (Integer, Integer)
inv_tup_tree = inv_tup_tree_fn (0, 0)

inv_tup_tree_fn :: (Integer, Integer) -> Tree (Integer, Integer)
inv_tup_tree_fn (a, b) = Node (inv_tup_tree_fn (a + 1, b)) (a, b) (inv_tup_tree_fn (a, b + 1))