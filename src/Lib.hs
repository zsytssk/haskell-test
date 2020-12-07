module Lib (someFunc, in_range, boolToString) where

-- someFunc :: Int
-- someFunc = foldr (\x acc -> acc ++ (show x)) "--" [1, 2, 3]
someFunc = foldl (\acc x -> acc ++ (show x)) "--" [1, 2, 3]

(((1 f "--") f 2) f 3)

test :: Int -> IO String
test i = do
  putStrLn "Foo Function has run!"
  return (show i)

filter_odd :: [Int] -> [Int]
filter_odd [] = []
filter_odd (x : xs)
  | (x `mod` 2 == 0) = x : filter_odd xs
  | otherwise = filter_odd xs

in_range :: Int -> Int -> Int -> Bool
in_range min max x =
  if lib then iub else False
  where
    lib = min <= x
    iub = max >= x

boolToString :: Bool -> String
boolToString True = "TRUE"
boolToString False = "FALSE"

add :: Num a => a -> a -> a
add a b = a + b

fac n = aux n 1
  where
    aux n acc
      | n <= 1 = acc
      | otherwise = aux (n -1) (n * acc)

addTuples :: [(Int, Int)] -> Int
addTuples [] = 0
addTuples (t : tx) =
  let (x, y) = t in (x + y) + addTuples tx

isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x : y : xs) =
  (x <= y) && isAsc (y : xs)

nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x : xs)
  | elemInArr x xs = nub xs
  | otherwise = x : (nub xs)

elemInArr :: (Eq a) => a -> [a] -> Bool
elemInArr _ [] = False
elemInArr e (x : xs) = (e == x) || (e `elemInArr` xs)

-- doubleList = map (\x -> x * 2)

hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath nodes s e
  | s == e = True
  | s < e = elem (s, s + 1) nodes && hasPath nodes (s + 1) e
  | s > e = elem (s, s -1) nodes && hasPath nodes (s -1) e

isAll e = foldr (\x -> (&&) $ x == e) True

rev :: [a] -> [a]
rev = foldl (\acc x -> x : acc) []

mapTest f = foldr (\x -> ((:) . f) x) []

prefixes :: [a] -> [[a]]
prefixes =
  foldr (\x -> (:) [x]) []

-- prefixes :: [a] -> [[a]]
-- prefixes =
--   foldr (\x acc -> [x] : (map ((:) x) acc)) []
