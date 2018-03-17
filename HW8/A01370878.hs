module HW8 where
  import Data.List

  mmult :: Num a => [[a]] -> [[a]] -> [[a]] 
  mmult a b = [ [ sum $ zipWith (*) ar bc | bc <- (transpose b) ] | ar <- a ]
  
  mean :: (Fractional a) => [a] -> a
  mean [] = 0
  mean xs = sum xs / Data.List.genericLength xs

  avgh list = [("Male", mean (map (\(gender:age) -> age) (filter (\(gender:height) -> gender == "Male") list))), ("Female", mean (filter (\(gender:height) -> gender == "Female") list))]