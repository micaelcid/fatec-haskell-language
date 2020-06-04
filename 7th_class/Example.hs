module Example where

-- Parametric polymorphism

-- Polymorphic function: a function that has arguments of distinct or dynamic types
-- You can't assume what argument you are receiving, then you shouldn't sum, concatenate etc

-- foo :: a -> a
-- foo x = x + 1


-- (a, b) => a * b 
-- Either a b => a + b
-- (a -> b) => b ^ a
-- Bool -> a => a ^ 2

foo :: (a, a) -> (Bool -> a)
foo (a1, a2) True = a1
foo (a1, a2) False = a2

goo :: (Bool -> a) -> (a, a)
goo f = (f True, f False)

-- That way, we can prove with Haskell that somehow a ^ 2 = a * a

-- How could we prove that 1 + 1 = 2?

-- Polymorphic types: A type has parameters
-- Int is monomorphic
-- Bool is monomorphic

data Bag a = Bag a a deriving Show

-- Bag is a polymorphic type
-- Bag Int is monomorphic type

-- Bag Int = Bag Int Int
-- Bag Bool = Bag Bool Bool

data Backpack a b = Backpack a b deriving Show

-- Backpack is polymorphic type in two arguments

-- :kind command reveals the polymorphism type
-- if one * appears, it means its a monomorphic type
-- if two or more * appear, it means its a polymorphic type

-- *Example> :kind Int
-- Int :: *

-- *Example> :kind Bag
-- Bag :: * -> *

-- *Example> :kind Bag Int
-- Bag Int :: *

-- *Example> :kind []
-- [] :: * -> *

-- *Example> :kind (,)
-- (,) :: * -> * -> *

-- *Example> :kind (->)
-- (->) :: * -> * -> *

-- *Example> :kind Backpack
-- Backpack :: * -> * -> *

-- Adhoc Polymorphism: Type Classes

-- Type-classes - Can have implementations of certain functions
-- acording to its type. Restriction of polymorphic types
-- Ex: deriving

data Course = CS | SWE

-- Show is a type class - a restriction of monomorphic types

instance Show Course where
  show CS = "Algorithm content"
  show SWE = "Good practices content" 

  -- Eq rules, Reflective, Simetry and Transitive
instance Eq Course where
  CS == SWE = True
  SWE == CS = False
  _ == _ = False

gluu :: Int -> Int -> Int
gluu k 0 = k
gluu k x
  | even x = k + even (k+1) (x-1) 
  | otherwise = k * even k (x-1)