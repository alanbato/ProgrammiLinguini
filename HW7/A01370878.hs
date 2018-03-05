module HW07 where

-- Inverts a list
invert :: [t] -> [t]
invert [] = []
invert (x:xs) = invert xs ++ [x]

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]
cleanString [] = []
cleanString [x] = [x]
cleanString (x:xs) = if x == y
    then cleanString xs
    else x : cleanString xs
    where (y:ys) = xs

-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples a i = filter (\x -> x `mod` i == 0) a

-- Evaluation of polynomials

evaluate :: [Double] -> Double -> Double
evaluate [] x = 0
evaluate (a:as) x = a*x^(length as) + (evaluate as x)

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString 1 = "1"
toBinaryString n
                | even n = (toBinaryString (n `div` 2)) ++ "0"
                | otherwise = (toBinaryString ((n - 1) `div` 2)) ++ "1"

-- Insertion sort

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
        | x < y = x:y:ys
        | otherwise = y:(insert x ys)

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
