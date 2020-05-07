module Example where
-- Recap 3rd nd 4th class

data Course = CS | SWE deriving (Eq, Show)

data Student = Student { name :: String, course :: Course } deriving Show

getCourseId :: Course -> Int
getCourseId CS = 1
getCourseId SWE = 2

studiesCs :: Student -> Bool
studiesCs x
  | course x == CS = True
  | otherwise = False

otherStudiesCs :: Student -> Bool
otherStudiesCs x = course x == CS

-- studiesCs Student { name = "Micael", course = CS }
-- otherStudiesCs Student { name = "Micael", course = CS }

factorial :: Int -> Int
factorial x
  | x <= 1 = 1
  | otherwise = x * factorial(x-1)

otherFactorial :: Int -> Int
otherFactorial 0 = 1
otherFactorial x = x * otherFactorial(x-1)

removeVowel :: String -> String
removeVowel [] = []
removeVowel (x:xs)
  | elem x "AEIOUaeiou" = removeVowel xs
  | otherwise = x : removeVowel xs

-- 6th class


-- High order functions

twice :: Int -> Int
twice x = 2 * x

calculate :: (Int -> Int) -> Int -> Int
calculate operation number = operation number

-- *Example> calculate twice 3-- 6

-- *Example> calculate (4*) 3
--12

-- Lambda: Anonymous functions

-- *Example> (\x -> 2 * x) 5
-- 10

-- *Example> (\x y -> x * y) 5 5
-- 25

-- Currying

sumNumbers :: Int -> Int -> Int -> Int
sumNumbers x y z = x + y + z

-- sumNumbers 1 = \y z -> 1 + y + z
-- sumNumbers 2 7 = \z -> 2 + 7 + z

-- HoF, Currying and Lambda are almost always together

-- Map
-- map :: (a -> b) -> [a] -> [b]

-- *Example> map (3 *) [1, 2, 3, 4, 5]
-- [3,6,9,12,15]

-- *Example> map length ["Micael", "Calel"]
-- [6,5]

-- Filter
-- filter :: (a -> Bool) -> [a] -> [a]

-- *Example> filter even [1, 2, 3, 4, 5, 6]
-- [2,4,6]

-- *Example> filter (>3) [1, 2, 3, 4, 5, 6]
-- [4,5,6]

-- *Example> filter (\x -> x == reverse x) ["ANA", "PHP", "HASKELL", "JAVA"]
-- ["ANA","PHP"]

-- Foldl
-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- foldl :: (b -> a -> b) -> b -> [a] -> b

-- *Example> foldl (+) 0 [1, 2, 3]
-- 6

-- *Example> foldl (*) 1 [1, 2, 3, 4, 5]
-- 120

-- foldl (\initial list -> initial + length list) 0 ["HASKELL", "PHP", "JAVA"]
-- 14