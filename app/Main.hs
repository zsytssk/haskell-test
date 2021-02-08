module Main where

-- import Lib (boolToString, in_range, someFunc)

import Control.DeepSeq
import Control.Exception (evaluate)

something :: Int -> [Int]
something x = map (* 2) [1 .. x]

somethingIO :: Int -> IO [Int]
somethingIO x = do
  return $!! map (* 2) [1 .. x]

main :: IO ()
main = do
  result1 <- evaluate $ force $ something 100
  result2 <- somethingIO 100
  return ()