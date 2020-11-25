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
