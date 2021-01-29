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

threadHello :: MVar () -> Chan () -> IO ()
threadHello mutex endFlags = do
  greeting <- getGreeting
  takeMVar mutex
  putStrLn greeting
  putMVar mutex ()
  writeChan endFlags ()

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  let n = 10
  mutex <- newEmptyMVar
  endFlags <- newChan
  mapM_ (const $ forkIO $ threadHello mutex endFlags) [1 .. n]
  putMVar mutex ()
  mapM_ (const $ readChan endFlags) [1 .. n]