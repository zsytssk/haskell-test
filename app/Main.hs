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

threadHello :: IO ()
threadHello = do
  greeting <- getGreeting
  -- putStrLn greeting
  print greeting

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  forkIO threadHello
  return ()