module Lib (someFunc) where

import Data.List hiding (insert)
import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

--  unsafePerformIO $ readFile path
-- unsafePerformIO $ getLine

-- hSetBuffering stdout NoBuffering
-- readFile :: FilePath -> IO String
-- putStr :: String -> IO ()
-- putStrLn :: String -> IO ()
-- getLine ::  IO String

someFunc = getLineMuli

test :: FilePath -> IO String
test path = do
  putStrLn "please input some str"
  name <- getLine
  return ("hello " ++ name)

getLineMuli :: IO [String]
getLineMuli = do
  name <- getLine
  if name /= "" then return [name] ++ [] else return []