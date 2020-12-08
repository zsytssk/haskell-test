## fold

## 反转数组

````hs
-- foldl (<+>) zz [a,b,c,d] = (((zz <+> a) <+> b) <+> c) <+> d
-- foldr (<+>) zz [a,b,c,d] = a <+> (b <+> (c <+> (d <+> zz)))
-- reverse list
rev :: [a] -> [a]
rev [] = []
rev [x] = [x]
rev arr = (last arr) : (rev $ init arr)

-- foldl :: (a -> b -> a) -> a -> [b] -> a
foldl (\acc x -> x : acc) []
foldl (flip (:)) []


```hs
-- prefixes
prefixes :: [a] -> [[a]]
prefixes = rev . addFix
  where
    addFix :: [a] -> [[a]]
    addFix [] = []
    addFix arr = arr : addFix (init arr)
    rev :: [a] -> [a]
    rev = foldl (\acc x -> x : acc) []

prefixes :: [a] -> [[a]]
prefixes =
  foldr (\x acc -> [x] : (map ((:) x) acc)) []

-- (:) x [y] -> [x, y]
-- map ((:) x) [[y], [z]] -> [[x, y], [x, z]]
-- [1, 2, 3] --> map ((:) x) [] -> [] -> [[3]]
    -- map ((:) 2) [[3]] -> [[2, 3]] -> [[2], [2, 3]]
    -- map ((:) 1) [[2], [2,3]] -> [[1,2], [1,2,3]] -> [[1], [1,2], [1,2,3]]
````

## 合并函数

```hs

(f.g) = (f (g))

map2D = map . map

f xs = map (\x -> x + 1) $ filter (\x -> x > 1) xs

count e =
  foldr (\x acc -> if e == x then acc + 1 else acc) 0

isAll e = foldr (\x -> (&&) $ x == e) True

length = foldr (\x -> (+) 1) 0

map f = foldr ((:) . f) []
```

## 匿名函数

```hs
map (\(x, y))-> x + y) [(1, 2), (3, 4)]
```

## filter_odd

```hs
filter_odd :: [Int] -> [Int]
filter_odd [] = []
filter_odd (x : xs)
-- 整除
  | (x `mod` 2 == 0) = x : filter_odd xs
  | otherwise = filter_odd xs
```

## 是否递增

```hs
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [_,[]] = True
isAsc (x : xs)
  | x > (head xs) = False
  | otherwise = isAsc xs

isAsc1 :: [Int] -> Bool
isAsc1 [] = True
isAsc1 [x] = True
isAsc1 (x : y : xs) =
  (x <= y) && isAsc1 (xs)



```

## 数组去重

```hs
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x : xs)
  | elemInArr x xs = nub xs
  | otherwise = x : (nub xs)
```

## element in arr

```hs
elemInArr :: (Eq a) => a -> [a] -> Bool
elemInArr _ [] = False
elemInArr e (x : xs) = (e == x) || (e `elemInArr` xs)
```

## add tuples

```hs
addTuples :: [(Int, Int)] -> Int
addTuples [] = 0
addTuples (t : tx) =
  let (x, y) = t in (x + y) + addTuples tx
```

## int to string

show

## fun as operator

someFunc = 10 `add` 20 `add` 50

## accumulator

- 先 执行一个函数 aux 然后再定义 aux

```hs
fac n = aux n 1
  where
    aux n acc
      | n <= 1 = acc
      | otherwise = aux (n -1) (n * acc)
```
