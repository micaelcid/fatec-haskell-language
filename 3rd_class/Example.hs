module Example where
  -- Type Constructor: e.g. "Weekday"
  -- Value Constructor: e.g. "Sunday"
  -- OR operator: "|"

  data Weekday = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday 
    deriving (Show, Eq, Ord, Enum)
  
    -- Every type constructor has an additional hidden Value Constructor: "undefined". 
  -- It defines the non-termination of a process.

  -- If you want to display a Value Constructor at screen, you need to add "deriving Show" to your type.
  
  -- This can be broadly used to specify systems / formal methods
  -- To look up: Formal Method Engineer


  -- Type Classes: e.g. "deriving"

  -- Type Class "Eq"
  -- Sunday == Monday
  -- Monday == Monday

  -- Type Class "Ord"
  -- Sunday > Tuesday

  -- Type Class "Enum"
  -- [Sunday .. Saturday]

  agenda :: Weekday -> String
  -- To convert a type in a string you could just:
  -- agenda day = show day
  -- agenda = show

  -- However, we are here to understand Pattern Match. It deconstructs a type when a function receives an argument
  -- It offers a way different ways to deal with a function's return according to constant or variable arguments
  agenda Monday = "A sad day"
  agenda Tuesday = "An okay day"
  agenda Wednesday = "Haskell"
  -- agenda Thursday = "Another okay day"
  agenda Friday = "A day for treasures"
  agenda Saturday = "A sabbatical day"
  -- agenda Sunday = "A lazy day"
  agenda x = "A lazy day... Who likes " ++ show x ++ "?"
  -- agenda _ = "A lazy day..."

  -- Exercise 1:
  -- Create a function "numberToWeekday" that converts a received number into a weekday

  -- numberToWeekday :: Int -> Weekday

  -- numberToWeekday 1 = Sunday
  -- numberToWeekday 2 = Monday
  -- numberToWeekday 3 = Tuesday
  -- numberToWeekday 4 = Wednesday
  -- numberToWeekday 5 = Thursday
  -- numberToWeekday 6 = Friday
  -- numberToWeekday 7 = Saturday
  -- This is a partial function because you can't coverage all branches with Pattern Match
  -- numberToWeekday _ = Saturday is a bad way of solving this corner case.

  -- Then we should solve this with Sum Types
  numberToWeekday :: Int -> Either String Weekday

  numberToWeekday 1 = Right Sunday
  numberToWeekday 2 = Right Monday
  numberToWeekday 3 = Right Tuesday
  numberToWeekday 4 = Right Wednesday
  numberToWeekday 5 = Right Thursday
  numberToWeekday 6 = Right Friday
  numberToWeekday 7 = Right Saturday
  numberToWeekday _ = Left "Error"

  -- Either is a pure promise - similar to Javascript, Right is resolve and Left is reject


  -- Exercise 2:
  -- Create a function "weekdayToNumber" that converts a received weekday into a number
  
  weekdayToNumber :: Weekday -> Int

  weekdayToNumber Sunday = 1 
  weekdayToNumber Monday = 2 
  weekdayToNumber Tuesday = 3 
  weekdayToNumber Wednesday = 4 
  weekdayToNumber Thursday = 5 
  weekdayToNumber Friday = 6 
  weekdayToNumber Saturday = 7 
  -- This is a total function because you can coverage all branches with Pattern Match


  -- Exercise 3:
  -- Create a function that translates the values of the type "Weekday" to the values of the type "DiaDaSemana"

  data DiaDaSemana = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado
    deriving Show

  weekdayToPortuguese :: Weekday -> DiaDaSemana

  weekdayToPortuguese Sunday = Domingo
  weekdayToPortuguese Monday = Segunda
  weekdayToPortuguese Tuesday = Terca
  weekdayToPortuguese Wednesday = Quarta
  weekdayToPortuguese Thursday = Quinta
  weekdayToPortuguese Friday = Sexta
  weekdayToPortuguese Saturday = Sabado


  data Month = January | February | March | April | May | June | July | August | September | October | November | December
    deriving Show

  data Calendar = Calendar Int Weekday Month
    deriving Show

  nextMonth :: Calendar -> Calendar
  nextMonth (Calendar day weekday January) = Calendar day weekday February
  nextMonth (Calendar day weekday February) = Calendar day weekday March
  nextMonth (Calendar day weekday March) = Calendar day weekday April
  nextMonth (Calendar day weekday April) = Calendar day weekday May
  nextMonth (Calendar day weekday May) = Calendar day weekday June
  nextMonth (Calendar day weekday June) = Calendar day weekday July
  nextMonth (Calendar day weekday July) = Calendar day weekday August
  nextMonth (Calendar day weekday August) = Calendar day weekday September
  nextMonth (Calendar day weekday September) = Calendar day weekday October
  nextMonth (Calendar day weekday October) = Calendar day weekday November
  nextMonth (Calendar day weekday November) = Calendar day weekday December
  nextMonth (Calendar day weekday December) = Calendar day weekday January