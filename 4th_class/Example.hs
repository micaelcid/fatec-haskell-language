module Example where

  -- Recursive functions

  fib :: Int -> Int
  fib 0 = 0
  fib 1 = 1
  fib n = fib (n-1) + fib (n-2)

  -- List Pattern Match
  
  -- [] -> Empty List
  
  -- (x:xs) -> One or more elements
  -- "FATEC" to (x:xs)? Yes
  -- x = 'F', xs = "ATEC"

  -- (x:[]) -> Only one element
  -- "FATEC" to (x:[])? No
  -- "A" to (x:[])? Yes
  -- x = 'A'

  -- (x:y:ys) -> Two elements or more
  -- "FATEC" to (x:y:ys)? Yes
  -- x = 'F', y = 'A', ys = "TEC"

  -- (x:_:ys) -> Two elements or more, but ignore the second
  -- "FATEC" to (x:_:ys)? Yes
  -- x = 'F', ys = "TEC"

  -- (x:y:z:w:u:us) -> Five elements or more, but ignore the second
  -- "FATEC" to (x:y:z:w:u:us)? Yes
  -- x = 'F', y = 'A', z = 'T', w = 'E', u = 'C', us = []

  removeVowels :: String -> String
  removeVowels [] = []
  removeVowels (x:xs)
    | x `elem` "AEIOUaeiou" = removeVowels xs -- If x is one of the elements in the list 'AEIOUaeiou', return the function with the rest
    | otherwise = x : removeVowels xs -- Otherwise, return the function with x concatenated with xs (do nothing)

  removeConsonant :: String -> String
  removeConsonant [] = []
  removeConsonant (x:xs)
    | x `notElem` "AEIOUaeiou" = removeConsonant xs -- If x is one of the elements in the list 'AEIOUaeiou', return the function with the rest
    | otherwise = x : removeConsonant xs


  -- Lists are recursive
  data List = End | Continuation Int List deriving Show
  -- Continuation 1 End
  -- Continuation 1 (Continuation 2 (Continuation 3 End))

  data Tree = Null | Leaf Int | Branch Int Tree Tree deriving Show
  -- Branch 10 (Branch 7 (Leaf 6) (Leaf 8)) (Branch 17 (Null) (Leaf 23))

  -- ERD
  treeInOrder :: Tree -> [Int]
  treeInOrder Null = []
  treeInOrder (Leaf x) = [x]
  treeInOrder (Branch x left right) = treeInOrder left ++ [x] ++ treeInOrder right

