module Lib (someFunc, in_range, boolToString) where

-- someFunc :: Int
someFunc = fac 1000

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

fac 0 = False
fac _ = True