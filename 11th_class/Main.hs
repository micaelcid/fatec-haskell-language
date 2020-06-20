module Main where
-- () unity or "void"
-- "stack ghc -- 11th_class/Main -o Main" to compile
-- "./Main" to run
-- main :: IO ()
-- main = putStrLn "Hello World!"

main :: IO ()
main = do
  putStrLn "Type a number: "
  x <- readLn
  putStrLn "Type another number: "
  y <- readLn
  putStrLn $ "Sum: " ++ show (x + y)

-- Or

main' :: IO ()
main' = 
  putStrLn "Type a number: " >> readLn >>= \x -> 
  putStrLn "Type another number: " >> readLn >>= \y -> 
  putStrLn $ "Sum: " ++ show (x + y)


safeHead :: [a] -> Maybe a 
safeHead [] = Nothing
safeHead (x:_) = Just x 
  
main'' :: IO () 
main'' = do 
  putStrLn "Type a letter: "
  pal <- getLine 
  case safeHead pal of 
    Nothing -> putStrLn "Erro..." 
    Just letra -> putStrLn $ "Letter: " ++ [letra] 