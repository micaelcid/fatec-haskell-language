module Example where


size :: String -> Int 
size x = length x


double :: Int -> Int
double x = 2*x


readd :: IO Int
readd = readLn


-- data Maybe a = Nothing | Just a


-- fmap :: Functor f => (a -> b) -> f a -> f b
-- instance Functor Maybe where
--      fmap f Nothing = Nothing 
--      fmap f (Just x) = Just (f x)


data Bag a = Bag a Int a deriving Show


-- f works only with polymorphic types.
instance Functor Bag where
    fmap f (Bag x i y) = Bag (f x) i (f y) 


-- f = (3*)
-- fmap (3*) (Bag 3 4 5) == Bag (3*3) 4 (3*5) 


-- Applicative Functor
data Client = Client { name :: String, age :: Int} deriving Show

-- *Example> pure Client <*> getLine <*> readd
-- Micael
-- 22
-- Client {name = "Micael", age = 22}