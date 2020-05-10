module FilterTuesday where

-- Exercise 4.7 of Alexandre's Garcia book: "Haskell: An introduction to functional programming"
-- 4.7) Create a type Day containing the weekdays. Create a function that receives a list of Days and filter the Tuesdays. 

data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday 
  deriving (Show, Eq)

weekdays = [Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday]

filterTuesday :: [Day] -> [Day]
filterTuesday days = filter (==Tuesday) days