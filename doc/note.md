https://www.youtube.com/watch?v=bsp5pJlw6R0&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=35

https://blog.csdn.net/My_Jobs/article/details/43451187

http://learnyouahaskell.com/chapters

- @todo 可以将自己的 haskell 的学习笔记放到 github 上

## 2021-02-25 09:59:45

- @ques 怎么运行 hp2ps
  - stack 不带这玩意...

## 2021-02-20 09:54:19

- @ques 如何检测 stack run 的时间消耗

## 2021-02-20 09:34:12

- @ques stack cabal install parallel

## 2021-02-07 09:37:47

- @ques whnf nf 是什么意思

## 2021-01-28 10:12:06

这代码就像是黑魔法

### end

- @todo multi thread 依次进行

## 2021-01-26 09:35:05

- @ques class 是什么东西

## 2021-01-22 09:31:46

- @ques 怎么编译整个项目

- stack ghc -- --make ./app/Main.hs -o test
- stack ghc -- --make -i ./src/Lib.hs ./app/Main.hs -o test

## 2021-01-20 09:51:14

- printHelp >> exitSuccess

## 2021-01-12 09:29:28

- @ques get data from environment

- @ques 如何获得多个输出

  - for 循环？

- @ques 如何 for 循环一个数组

- Couldn't match type ‘[]’ with ‘IO’

### end

- @ques 如何 putStr 之后再 getLine
  - do

## 2020-12-31 09:55:36

- @ques 怎么取 Tree 中的元素...

- @ques 怎么插入在 leaf 中插入一个值

  - 怎么改变原来的节点...

- @ques 如何拆分数组
  - 怎么在数组后插入一个

### end

- ques 如何 show Tree

  - deriving

## 2020-12-22 09:49:40

- @ques zipWith

- @ques Monads law

- @ques `>>` 有什么用

- @ques 一个函数能不能支持不同的参数 (函数有不同的定义)

- @ques

- @ques typeClass https://www.youtube.com/watch?v=bv7aenMgSkg&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=16

- @ques IO() 函数 获得输入 传给其他变量？

- @ques `:info Ord`

  - class 语法

- @ques derive typeClass

## 2020-12-16 09:47:26

- @todo 二叉树 遍历 方式 + 转化

- @ques data type

- @ques Leaf a | Node a 这玩意是什么意思
  - 这样定义类型真奇怪... 也很强大

## 2020-12-09 09:31:29

- @ques haskell foldl get array index

  - `zip [1 .. length (list)] list`

- @ques 怎么 怎么把 (x, y) -> x

- @ques foldl 怎么 获取 arr 的 index

### end

- @ques haskell 怎么在运行的过程中 print

  - 这太不友好了
  - trace

- @ques lagrange

  - 我怎么知道 xj
  - fold 如何获取 arr 的 index

- @ques 下面的语句有什么问题 因该是 3.0 怎么是 3.3333
  - foldl 的参数顺序搞反了

```hs
test :: Float -> Int -> [Float] -> Float
test x j arr =
  let xj = arr !! j
   in let fArr = deleteAt j arr
      in foldl (\t acc -> ((x - t) / (xj - t)) * acc) 1 fArr
```

## 2020-12-04 09:56:48

- @ques foldl 执行顺序
  - `foldl (\acc x -> (show x) ++ acc) "" [1, 2, 3]`
  - 按顺序一个接一个的执行
  - `xn f x(n-1) f ... x2 f x1`

怎么加载多个语句

## 2020-12-03 20:33:58

- @ques 下面代码怎么理解

```hs
prefixes :: [a] -> [[a]]
prefixes =
  foldr (\x acc -> [x] : (map ((:) x) acc)) []
```

## 2020-11-30 09:48:20

- @ques dataType 到底讲什么的 有什么用

- @ques rev 怎么取数组的最后一个元素

### end

- @ques 整除的标示是什么

  - `mod`

- @ques

  - `isAll e = foldr (\x -> (&&) $ x == e) True` 怎么理解
  - `map f = foldr ((:) . f) []` 如何理解

    - `.` 是干嘛的
    - `(:)` 是干嘛的
    - $ 和 . 的左右到底是什么

- @ques hasPath

  - `[(n, m) | (n, m) <- xs, n /= x]`
  - `let .. in`
    - 赋值 和 where 对应
  - `or`
    - `or [x]`只要数组中有一个为 true 就为 true
  - `n /= x`
    - 是不等于的意思吗, 应该是的

## 2020-11-27 13:35:39

(x-y/n-m) > 0
数组中去掉某个元素
如何保存原来的素组

下一个是 -1 还是 加 1

一开始就把数组创建 然后在去一个个的判断 目标数组 有没有
包含当前数组就可以了

- 怎么把多个语句 组合成一个函数
  - where

## 2020-11-25 11:08:52

- @ques 怎么求和 [(1, 2), (2, 4), (3, 5)]

- @ques Haskell async/await
- @ques Haskell http

- ` n : asc (n + 1) m` 可以将还未完成的计算 累计在一起

- @learn react rust

  - rust write a language

- @note

  - guards pattern match

### end

- @ques dart is slow
- @todo jss react-pro
- @ques 可逆递归 不可逆递归

  - 有限递归 + 无限递归

- @ques 1 怎么就变成 acc 了 问什么不直接使用 1

## 2020-11-19 18:29:06

- @ques generatic

- @ques accumulator

- @ques vscode 插件 代码修好了 语法错误还在

- @ques 函数怎么执行多条语句

- @ques 如何定义一个函数
- @ques haskell 的特别之处 到底在什么地方
