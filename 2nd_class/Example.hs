module Example where

  -- Separator: "::"
  double :: Int -> Int
  double x = 2 * x

  sum :: Int -> Int -> Int -> Int
  sum x y z = x + y + z

  reverseLastTwoChar :: String -> String
  reverseLastTwoChar word = take 2 (reverse word)
  
  u :: Int
  u = 7

  demon :: Int
  demon = demon + 1

  -- LIST: is a data structure that contains values with the same type. 
  -- It can be finite, infinite or null and vary its size as well: [1, 2, 3]

  -- LIST COMPREHENSION: Generates lists from an expression, iteration and filter rules
  -- Ex: [x | x <- [1 .. 10], x > 2, x < 8]
  -- In portuguese you could read: "x pertence aos naturais, tal que,
  -- x é um intervalo de 1 a 10 e x é maior que 2 e x é menor que 8"

  loop1 :: Int -> Int -> [Int]
  loop1 start end = [x | x <- [start .. end], x > 2, x < 8]

  table :: Int -> [Int]
  table number = [x * number | x <- [1 .. 10]]

  boringTable :: Int -> [[[Int]]]
  boringTable x = replicate x [table n | n <- [1..9]]

  pg :: Int -> [Int]
  pg number = [x^number | x <- [1 .. 9], x /= 3]
  
  isEven :: Int -> Bool
  isEven = even
  

  -- TUPLE: is a data structure that contains values with different types.
  -- It's size is static and finite
  -- (1, "1", '1', True)

  -- Sutupla
  -- [(x, y) | x <- ["MICAEL", "MANOLO", "BRANDAO"], y <- ["MICAEL", "MANOLO", "BRANDAO"]]
  -- [(x, y) | x <- ["MICAEL", "MANOLO", "BRANDAO"], y <- ["MICAEL", "MANOLO", "BRANDAO"], x /= y]
  sumTuple :: (Int, Int, Int) -> Int
  sumTuple (x, y, z) = z + y + z

  -- Baralho
  -- [(numero, naipe) | numero <- "A234567890JQK", naipe <- ["ZAP", "COPAS", "ESPADILHA", "PIKAFUMO"]]
  -- [(numero, naipe) | numero <- "A234567890JQK", naipe <- ["ZAP", "COPAS", "ESPADILHA", "PIKAFUMO"]] ++ [('C', "CORINGA")]
  