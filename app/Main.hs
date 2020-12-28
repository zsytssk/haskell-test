module Main where

-- import Lib (boolToString, in_range, someFunc)
import Lib (someFunc)

main :: IO ()
main =
  myPrint (someFunc)

myPrint :: Show a => Maybe a -> IO ()
myPrint (Just x) = print $ "Just " ++ (show x)
myPrint n = print n
