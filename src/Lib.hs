module Lib (someFunc, in_range, boolToString) where

import Debug.Trace (traceShow)

someFunc = lagrange [(10, 22)] 100

lagrange :: [(Float, Float)] -> Float -> Float
lagrange arr d =
  let xarr = [x | (x, _) <- arr]
   in let tarr = zip [0 .. length (arr) -1] arr
       in foldl (\acc (index, (x, y)) -> y * (lj d index xarr) + acc) 0 tarr

lj :: Float -> Int -> [Float] -> Float
lj x j arr =
  let xj = arr !! j
   in let fArr = deleteAt j arr
       in foldl (\acc t -> acc * ((x - t) / (xj - t))) 1 fArr

-- lagrange :: [(Float, Float)] -> Float -> Float
-- lagrange xs x = foldl (\acc (xj, y) -> acc + (y * l xj)) 0 xs
--   where
--     l xj =
--       foldl
--         ( \acc (xk, _) ->
--             if xj == xk
--               then acc
--               else acc * ((x - xk) / (xj - xk))
--         )
--         1
--         xs

deleteAt :: Int -> [a] -> [a]
deleteAt idx xs = lft ++ rgt
  where
    (lft, (_ : rgt)) = splitAt idx xs

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
  foldr (\x acc -> [x] : (map ((:) x) acc)) []

-- lagrange :: [(Float, Float)] -> Float -> Float
-- lagrange = flodr