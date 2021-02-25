import Control.DeepSeq (force)
import Control.Exception (evaluate)
import Data.List

xs :: [Int]
xs = [1 .. 10000000]

f = foldl (+) 0 xs

g = foldl' (+) 0 xs

main :: IO ()
main = do
  evaluate $ force xs
  putStrLn $ show f
  putStrLn $ show g
