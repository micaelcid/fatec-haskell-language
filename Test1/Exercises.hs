module Exercises where

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib k = fib k + fib (k - 1)

sumAllOddAbove19 :: [Int] -> Int
sumAllOddAbove19 list = foldl (+) 0 (filter (\x -> x > 19 && odd x) list)

data Resp = Sim | Nao

instance Show Resp where
  show Sim = "True"
  show Nao = "False"

instance Eq Resp where
  Sim == Sim = True
  Nao == Nao = True
  _ == _ = False

foo :: String -> String
foo [] = []
foo (x:[]) = []
foo (x:y:ys) 
    | length ys > 3 =  [succ x] ++ [pred y] ++ foo ys
    | otherwise = y : x : foo (y:ys)

-- foo "HASKELL" 
--   | length "SKELL" > 3 = [succ 'H'] ++ [pred 'A'] ++ foo "SKELL" = "I" ++ "@" ++ "KSEKLELL" = "I@KSEKLELL"

-- foo "SKELL"
--   | otherwise = 'K' : 'S' : foo ("KELL") = 'K' : 'S' : "EKLELL" = "KSEKLELL"

-- foo "KELL"
--   | otherwise = 'E' : 'K' : foo ("ELL") = 'E' : 'K' : "LELL" = "EKLELL"

-- foo "ELL"
--   | otherwise = 'L' : 'E' : foo ("LL") = 'L' : 'E' : "LL" =  "LELL"

-- foo "LL"
--   | otherwise = 'L' : 'L' : foo ("L") = 'L' : 'L' : [] = "LL"

-- foo ('L':[]) = []

