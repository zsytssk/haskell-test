module Lib (someFunc) where

import Data.List hiding (insert)
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

insert :: (Ord a) => a -> Tree a -> Tree a
insert a (Leaf b) = if b < a then b = Node (Leaf b) a
insert a (Node l v r) = if v < a then insert a l else insert a r

inorder :: Tree a -> [a]
inorder (Leaf b) = b : []
inorder (Node l v r) = inorder l : v : inorder r