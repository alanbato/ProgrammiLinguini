nextInt  :: Int -> Int --definition
nextInt 1000 = 999
nextInt x = x + 1

sumOfSquares :: Int -> Int -> Int --el último es el result typem los demás son los parámetros
sumOfSquares x y =  x * x + y * y

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x - 1)

findInt :: [Int] -> Int -> Bool --la lisa de ints, el que buscas y si es T o F
findInt [] _ = False --el underscore es "se que hay algo ahi pero me vale que es"
--findInt lst x = if (head lst) == x
--                then True
--                else findInt (tail lst) x   
findInt (first:rest) x = if first == x --al poner (first:rest) es igual que decir head y tail, se ve mejor
                        then True
                        else findInt(rest) x

main = do 
    print $ nextInt 100
    print $ sumOfSquares 2 3
    print $ factorial 5
    print $ findInt [1, 2, 3, 4, 5] 20
