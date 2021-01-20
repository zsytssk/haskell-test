module Lib (someFunc) where

import System.Environment
import System.Exit
import System.IO.Unsafe (unsafePerformIO)

someFunc = unsafePerformIO $ printHelp

mainAct [] = do
  putStrLn "Needs a greeting!"
  printHelp
  exitFailure
mainAct args = do
  let greeting = unwords args
  name <- lookupEnv "USER"
  putStrLn $ maybe "no user to greet!" (\name -> greeting ++ "" ++ name) name

printHelp = do
  progName <- getProgName
  putStrLn progName

printVersion = do
  putStrLn "v1"