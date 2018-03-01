module HW07 where

-- Inverts a list
invert :: [t] -> [t]
invert [] = []
invert (x:xs) = invert xs ++ [x]

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]
cleanString _ = error "Not yet implemented."

-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples x i = filter (\e -> e `mod` i == 0) x

-- Evaluation of polynomials
evaluate :: [Double] -> Double -> Double
evaluate _ _ = error "Not yet implemented."

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString _ = error "Not yet implemented."

-- Insertion sort
insertionSort :: [Int] -> [Int]
insertionSort _ = error "Not yet implemented."