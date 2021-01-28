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

threadHello :: Chan () -> IO ()
threadHello endFlags = do
  greeting <- getGreeting
  putStrLn greeting
  writeChan endFlags ()

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  endFlags <- newChan
  forkIO $ threadHello endFlags
  mapM_ (\_ -> readChan endFlags) [1 .. 2]
  return ()