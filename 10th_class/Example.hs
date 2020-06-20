module Example where

import Control.Monad

readLine :: IO Int
readLine = readLn
  
-- *Example> pure(*) <*> readLine <*> readLine
-- 10
-- 5
-- 50

-- Prelude> pure(*) <*> Just 5 <*> Just 4
-- Just 20

safeDiv :: Double -> Double -> Maybe Double
safeDiv x 0 = Nothing
safeDiv x y = Just (x / y)

-- *Example> safeDiv 10 5
-- Just 2.0
-- *Example> safeDiv 5 0
-- Nothing

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

-- *Example> safeHead [1,2,3]
-- Just 1
-- *Example> safeHead []
-- Nothing


-- instance Applicative Maybe where
--   pure x = Just x
--   (Just f) <*> (Just x) = Just (f x)
--   Nothing <*> _ = Nothing
--   _ <*> Nothing = Nothing

-- pure (*) <*> Just 5 <*> Just 4
-- Just (*) <*> Just 5 <*> Just 4
-- (Just (*) <*> Just 5) <*> Just 4


-- Applicative Functors rules

-- 1) pure acts as a neutral element to <*>
-- 2) Composition: (pure (.) <*> f <*> g) <*> x = f <*> (g <*> x)
-- 3) Homomorphism: pure f <*> pure x = pure (f x)
-- 4) Interchangeability: g <*> pure x = pure (\f -> f x) <*> g
--                        Just (2*) <*> pure 5 
--                        is equal to
--                        Just (\f -> f 5) <*> Just (2*)





----------------------------------------------------------------
-- Hask: Categoria dos tipos do Haskell e suas funcoes
-- (kind *)

-- Functors are mapable things 
-- (* -> *, Maybe, id, [], IO)

-- Natural Transformation is one morphism between endofunctors 
-- (Functor f, Functor g) => f a -> g a

-- Endofunctor category: 
-- A collection of objects that are functors with their morphism

-- toMaybe :: a -> Maybe a
-- toMaybe a = Maybe a

-- unMaybe :: Maybe a -> a
-- unMaybe Maybe a = a

-- [] a -> Maybe a
-- [] to Maybe
-- [] ~> Maybe
-- safeHead :: [a] -> Maybe a
-- safeHead [] = Nothing
-- safeHead (x:_) = Just x


-- A Monad in a category C is a triple (m, return, join)
-- m is an endofunctor
-- return is a natural transformation (return :: a -> m a) 
-- join is a naterual transformation (join :: m (m a) -> m a)
-- m m ~> m

-- About axioms:
-- return is neutral
-- join is assosciative

-- class Functor m => Monad m where
--   return :: a -> m a
--   (>>=) :: m a -> (a -> m b) -> m b
--   (>>=) = join (fmap f x)
--   join :: m (m a) -> m a
--   join = (>>= id)

-- instance Monad Maybe where
--     return x = Just x
--     join (Just (Just x)) = Just x
--     join (Just Nothing) = Nothing
--     join Nothing = Nothing

-- *Example> :t join
-- join :: Monad m => m (m a) -> m a
-- *Example> join ["HASKELL", "OI"]
-- "HASKELLOI"