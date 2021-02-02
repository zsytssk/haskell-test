module Main where

-- import Lib (boolToString, in_range, someFunc)

import Control.Concurrent
import Lib (someFunc)
import System.IO

getGreeting :: IO String
getGreeting = do
  tid <- myThreadId
  let greeting = "Hello from" ++ show tid
  return $! greeting

threadHello :: QSem -> QSemN -> IO ()
threadHello mutex endFlags = do
  greeting <- getGreeting
  waitQSem mutex
  putStrLn greeting
  signalQSem mutex
  signalQSemN endFlags 1

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  let n = 10
  mutex <- newQSem 0
  endFlags <- newQSemN 0
  mapM_ (const $ forkIO $ threadHello mutex endFlags) [1 .. n]
  signalQSem mutex
  -- mapM_ (const $ readChan endFlags) [1 .. n]
  waitQSemN endFlags n