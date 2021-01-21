module Main where

-- import Lib (boolToString, in_range, someFunc)
import Lib (someFunc)
import System.Environment
import System.Exit

-- main :: IO ()
-- main =
--   print (someFunc)

main = do
  args <- getArgs
  if "-h" `elem` args || "--help" `elem` args
    then printHelp >> exitSuccess
    else
      if "-v" `elem` args || "--version" `elem` args
        then printVersion >> exitSuccess
        else mainAct args

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