module Lib (someFunc) where

import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

someFunc = take 5 nat

ones = 1 : ones

nat = asc 1 where asc n = n : (asc $ n + 1)