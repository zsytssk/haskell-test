module Lib (someFunc) where

import Data.Char
import Data.List hiding (insert)
import Data.Maybe
import Debug.Trace (traceShow)
import System.IO.Unsafe (unsafePerformIO)

--  unsafePerformIO $ readFile path
-- unsafePerformIO $ getLine

-- hSetBuffering stdout NoBuffering
-- readFile :: FilePath -> IO String
-- putStr :: String -> IO ()
-- putStrLn :: String -> IO ()
-- getLine ::  IO String

-- someFunc = findString "is" "this is a test"

-- someFunc = tails "this is a test"
someFunc = map lower $ words "sdfsdfsdfds sfsdfdsfsd vsdfdsfsdfds 👌 \n sdfsdfdsfds"

test :: String -> String
test str = filter (\x -> isLetter x || isSpace x) str

lower :: String -> String
lower = map toLower

data SomeData = Either Int String

findStr = do
  list <- getLineMulti
  con <- readFileStr "./LICENSE"
  print $ map (findString con) list
  return ""

-- return []

readFileStr :: FilePath -> IO String
readFileStr path = do
  a <- (readFile path)
  return a

getLineMulti :: IO [String]
getLineMulti = do
  name <- getLine
  if name /= ""
    then do
      x <- getLineMulti
      return $ name : x
    else return []

findString :: (Eq a) => [a] -> [a] -> Int
findString str search = fromMaybe (-1) $ findIndex (isPrefixOf search) (tails str)