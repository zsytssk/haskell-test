import Control.DeepSeq
import Control.Exception (evaluate)

something :: Int -> [Int]
something x = map (* 2) [1 .. x]

somethingIO :: Int -> IO [Int]
somethingIO x = do
  return $!! map (* 2) [1 .. x]

main :: IO ()
main = do
  result <- evaluate $ force $ something 1000000
  result <- somethingIO 1000000
  return ()