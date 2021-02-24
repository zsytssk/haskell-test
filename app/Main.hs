import Data.List (reverse)

delete :: (Eq a) => [a] -> a -> [a]
delete [] _ = []
delete (x : xs) d = if x == d then xs else x : delete xs d

sort :: (Ord a, Eq a) => [a] -> [a]
sort [] = []
sort [x] = [x]
sort (x : xs) = x' : sort xs'
  where
    x' = foldl min x xs
    xs' = delete (x : xs) x'

main :: IO ()
main = do
  putStrLn $ show $ sort $ reverse [1 .. 1000]
