module Lib (someFunc) where

import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

someFunc = unsafePerformIO $ greet

greet :: IO String
greet = do
  putStrLn "what's your name?"
  name <- getLine
  return ("hello " ++ name)