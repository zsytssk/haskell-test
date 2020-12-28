module Lib (someFunc) where

import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

someFunc = maybeAdd (Just 1) (Nothing)

maybeAdd :: (Monad m, Num b) => m b -> m b -> m b
maybeAdd mx my = mx >>= (\x -> my >>= (\y -> return $ x + y))