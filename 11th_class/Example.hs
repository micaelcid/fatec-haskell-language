module Example where

import Control.Monad
import Control.Applicative

-- What is a monad:

-- instance Monad [] where
--   return x = [x]
--   join = concat

-- (concat <=< return ) [[1, 2, 3], [4, 5, 6]]
-- (concat <=< fmap return ) [[1, 2, 3], [4, 5, 6]]
-- [1,2,3,4,5,6]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- What is not a Monad:

-- instance Monad [] where
--   return x = repeat x
--   join = concat

-- (concat <=< repeat ) [[1, 2, 3], [4, 5, 6]]
-- (concat <=< fmap repeat ) [[1, 2, 3], [4, 5, 6]]
-- [1,2,3,1,2,3...

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- class Applicative m => Monad m where
--   return :: a -> m a
--   (>>=) :: m a -> (a -> mb) -> m b

-- '>>=' is bind, similar to Javascript's 'then'

func :: Int -> Maybe Int
func z = Just z >>= \x -> Just (x + 1) >>= \y -> Just (x + y)
-- *Example> func 10
-- Just 21

func' :: Int -> Maybe Int
func' z = do
  x <- Just z
  y <- Just (x + 1)
  return (x + y)

-- *Example> func' 10
-- Just 21

-- In Monads, you can define which computation to choose. You can make conditions
-- They are Dynamic

greaterZ :: Int -> Maybe Bool
greaterZ x
  | x > 0 = Just True
  | x < 0 = Just False
  | otherwise = Nothing

monadicCondition :: Monad m  => m Bool -> m a -> m a -> m a
monadicCondition condition true false = do
  trueFalse <- condition
  case trueFalse of 
    True -> true
    False -> false

-- *Example> monadicCondition(greaterZ 3) (Just 4) (Just 5)
-- Just 4
-- *Example> monadicCondition(greaterZ (-3)) (Just 4) (Just 5)
-- Just 5
-- *Example> monadicCondition(greaterZ 0) (Just 4) (Just 5)
-- Nothing

-- Why Nothing?
-- instance Monad Maybe where
--   return x = Just x
--   Just x >>= f = f x
--   Nothing >>= Nothing

-- In Applicative Functor, you can't

iif :: Bool -> a -> a -> a
iif cond t f =
  if cond then t else f

applicativeCondition :: Monad m  => m Bool -> m a -> m a -> m a
applicativeCondition condition true false = pure iif <*> condition <*> true <*> false

-- *Example> applicativeCondition(greaterZ 0) (Just 4) Nothing
-- Nothing
-- *Example> applicativeCondition(greaterZ 4) (Just 4) Nothing
-- Nothing
-- *Example> applicativeCondition(greaterZ (-3)) (Just 4) Nothing
-- Nothing

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
