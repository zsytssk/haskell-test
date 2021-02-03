module Main where

-- import Lib (boolToString, in_range, someFunc)

import Control.Concurrent
import Control.Concurrent.STM
import Lib (someFunc)
import System.IO

type Result = TVar (Int, Int)

addResult :: Result -> Int -> STM ()
addResult result x = do
  (sum, endCtrl) <- readTVar result
  writeTVar result (sum + x, endCtrl + 1)

waitForCounter :: Result -> Int -> STM Int
waitForCounter result limit = do
  (sum, endCtrl) <- readTVar result
  if endCtrl < limit then retry else return sum

main :: IO ()
main = do
  let n = 100
  result <- atomically $ newTVar (0, 0)
  mapM_ (\x -> forkIO $ atomically $ addResult result x) [1 .. n]
  sum <- atomically $ waitForCounter result n
  putStrLn $ "Sum [1.. n] = " ++ show sum