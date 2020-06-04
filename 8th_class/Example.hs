module Example where
  import Control.Monoid
  import Data.Monoid

  data Bag a = Bag a a 

  instance Num a => Num (Bag a) where
    (Bag x y) + (Bag z w) = Bag (x+z) (y+w)
    negate (Bag x y) = Bag (-x) (-y)
    (Bag x y) * (Bag z w) = Bag (x*z) (y*w) 
    abs (Bag x y) = Bag (abs x) (abs y) 
    signum (Bag x y) = Bag (signum x) (signum y) 
    fromInteger z = Bag (fromInteger z) (fromInteger z)
 
  instance Show a => Show (Bag a) where
    show (Bag x y) = 
      "X: " ++ show x ++ " - Y: " ++ show y
  
  class Decidable a where
    decidable :: a -> Bool

  instance Decidable Int where
    decidable x
      | odd x = True
      | otherwise = False

  instance Decidable Bool where
    decidable = id

  instance Decidable Char where
    decidable '' = False
    decidable x = True


  -- data Bool = True | Bool deriving Show
  -- Sum, Product 
  data And = And Bool deriving Show
  data Or = Or Bool deriving Show  

  instance Semigroup Or where 
      (Or x) <> (Or y) = Or (x || y)

  instance Monoid Or where 
      mempty = Or False
      
  instance Semigroup And where 
      (And x) <> (And y) = And (x && y) 

  -- True && True = True
  -- True && False = False 
  -- False && True = False 
  -- False && False = False
  instance Monoid And where 
      mempty = And True
      