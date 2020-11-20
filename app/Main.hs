module Main where

-- import Lib (boolToString, in_range, someFunc)
import Lib (boolToString, in_range, someFunc)

main :: IO ()
main =
  putStrLn (show someFunc)
