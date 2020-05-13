module Task.Exercises where

-- Alexandre Garcia de Oliveira's book: "Haskell: An introduction to functional programming"
-- Implementation of `map`, `filter` and `foldl` in the following exercises:

-- 2.1) Generate the lists

ex2A :: [Int]
ex2A = map (11 ^) [0..6]

ex2B :: [Int]
ex2B = filter (\x -> mod x 4 /= 0 ) [1..39]

ex2C :: [String]
ex2C = map (\x -> "A" ++ [x] ++ "BB") ['a'..'g']

ex2D :: [Int]
ex2D = filter (\x -> x /= 14 && x /= 23 && x /= 35) [5,8..41]

ex2E :: [Float]
ex2E = map (\x -> 1 / 2 ^ x) [0..5]

ex2F :: [Int]
ex2F = filter (\x -> mod x 9 == 1) [1..64]

ex2G :: [Int]
ex2G = filter (\x -> mod x 2 == 0 && x /= 6 && x /= 14 && x/= 20 && x /= 26) [1..30]

ex2H :: String
ex2H = filter (\x -> x /= 'B' && x /= 'F' && x /= 'H' && x /= 'I' && x /= 'K') ['@', 'A'..'L']

-- 4.6) Create a function `func` that receives a (String -> String) function f 
-- and a String s that returns the reverse of s concatenated with the application of the function f at s .

func :: (String -> String) -> String -> String
func f s = foldl (\xs x -> x:xs) [] s ++ f s

removeVowels :: String -> String
removeVowels string = filter (\x -> notElem x "AEIOUaeiou") string

-- 4.7) Create a type Day containing the weekdays. Create a function that receives 
-- a list of Days and filter the Tuesdays. 

data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday 
  deriving (Show, Eq)

filterTuesday :: [Day] -> [Day]
filterTuesday days = filter (==Tuesday) days

weekdays = [Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday]