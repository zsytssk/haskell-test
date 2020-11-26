module Lib (someFunc, in_range, boolToString) where

-- someFunc :: Int
someFunc = addTuples [(1, 2), (2, 4), (3, 5)]

in_range :: Int -> Int -> Int -> Bool
in_range min max x =
  if lib then iub else False
  where
    lib = min <= x
    iub = max >= x

boolToString :: Bool -> String
boolToString True = "TRUE"
boolToString False = "FALSE"

add :: Num a => a -> a -> a
add a b = a + b

fac n = aux n 1
  where
    aux n acc
      | n <= 1 = acc
      | otherwise = aux (n -1) (n * acc)

addTuples :: [(Int, Int)] -> Int
addTuples [] = 0
addTuples (t : tx) =
  let (x, y) = t in (x + y) + addTuples tx