import Control.Concurrent
import Control.Concurrent.STM
import System.IO

type Result = TVar (Int, Int)

addToResult :: Result -> Int -> STM ()
addToResult result x = do
  (sum, endCtrl) <- readTVar result
  writeTVar result (sum + x, endCtrl + 1)

waitForCounter :: Result -> Int -> STM Int
waitForCounter result limit = do
  (sum, endCtrl) <- readTVar result
  if endCtrl < limit then retry else return sum

main :: IO ()
main = do
  let n = 1000000
  result <- atomically $ newTVar (0, 0)
  mapM_ (\x -> forkIO $ atomically $ addToResult result x) [1 .. n]
  sum <- atomically $ waitForCounter result n
  putStrLn $ "Sum [1..n] = " ++ show sum