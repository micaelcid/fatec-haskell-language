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