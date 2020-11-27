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
