module Lib (someFunc, in_range, boolToString) where

-- someFunc :: Int
someFunc = halvePerfectly 10

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

-- asc :: Int -> Int -> [Int]
--   asc n m
--     | m < n = []
--     | m == n = [m]
--     | m > n = n : asc (n + 1) m
asc :: Int -> Int -> [Int]
asc n m
  | m < n = []
  | m == n = [m]
  | m > n = n : asc (n + 1) m

halvePerfectly :: Integer -> Maybe Integer
halvePerfectly i
  ｜ (i `mod` 2 == 0) = Just (i `div` 2)
  ｜ otherwise = Nothing