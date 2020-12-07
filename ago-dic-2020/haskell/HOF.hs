-- HIGHER ORDER FUNCTIONS

--lambda functions
--pones un backslash antes de los parametros para definir que es lambda fn
(\x -> x + 1) 10 --11
(\x y -> x * y) 3 4 --12
-- puedes mandar como parametros el resultado de otras lambda fns
(\x -> x - 10) ((\x y -> x * y) 3 4) --2
-- por ejemplo aqui como uso fst y snd, DEBE de ser una tuple
(\x -> fst x * snd x) (3, 5) --15

--map
--applies a function to a list and returns a list, solo toma una list, no puedes mandarle más de ahuevo
map function list
map sqrt [4, 9, 16, 25] -- [2.0, 3.0, 4.0, 5.0]
--w lambda fns
map (\x -> x * x) [1, 2, 3, 4, 5] -- [1, 4, 9, 16, 25]

dotProduct :: [Int] -> [Int] -> Int
dotProduct v w = sum (map (\(x, y) -> x * y) (zip v w)) --el zip v w crea una lista de tuples

--all
--evaluate all elements in a list using a predicate, si todos aplican regresa true
all even [1, 2, 3, 4, 5] --false
all even [2, 4, 6, 8, 10] --true
--any
--evaluate all elements in a list using a predicae, si alguno aplica regersa true
any even [1, 2, 3, 4, 5] --true
any even [2, 3, 5, 9, 11] --true


--filter
--aplica un predicado a una lista, los que apliquen, te los regresa en otra lista
filter even [1, 2, 3, 4, 5] --[2,4]
map even [1, 2, 3, 4, 5] --[False, True, False, True, False]
filter (> 3) [1, 2, 3, 4, 5] --[4, 5] --puedes usar esto envez de lambda function si son conditional operations
filter (\x -> odd && x < 10) [3, 6, 9, 12, 15] --[3,9]

--quicksort toma un pivote y recursivamente divide y sortea
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (first:rest) = let --let te deja declarar variables para usarlas en el in      let y in van juntos siempre
    leftList = filter (< first) rest
    rightList = filter (>= first) rest
    in 
    (quicksort leftList) ++ [first] ++ (quicksort rightList)

--foldl
--reduces a list by applying a binary operator (first argument) from left to right, 
--using the second argument as an initial value for the calculation
--evalua de izq a derecha y el resultado lo pone en la primera posicion de la lista, y asi hasta que se acaba
foldl (-) 1 [2, 3, 4, 5] --  -13
foldl (\x y -> x - y) 1 [2, 3, 4, 5] --  -13
--fold1 es como fold, pero solo toma un argument, entonces tienes que inckuir el que pondrias al principio del otro
fold1 (-) [1, 2, 3, 4, 5] -- -13

--foldr
--como foldr pero envez de izq a der, es de der a izq
foldl (-) 1 [2, 3, 4, 5] --  -1
foldr1 (-) [2, 3, 4, 5, 1] -- -1
foldr1 (-) [1, 2, 3, 4, 5] -- -3

--compose
--toma dos funciones y las encadena
(f . g . h) x is eq to f (g (h x))
--aplica primero el sum y dsps el sqrt
--  <-----------     asi se evaluan xd
    (sqrt . sum) [4, 9, 16, 25] -- 7.3484
(fold1 (*) . map abs) º[1, -2, 3] -- 6

--guards
--used for cases definition, make code simpler to read
--solo cambia la sintax, pero hace lo mismo
factorial:: Int -> Int
factorial n
    | n == 0 = 1
    | n > 0 = n * factorial (n - 1)

getEven :: [Int] -> [Int]
getEven [] = []
getEven (first:rest)
    | even first = first : getEven rest
    | otherwise = getEven rest  --otherwise cubre todos los demas cases

--generators
--insert this    coming from this generator    that fits this
[xi |               xi <- x,                        xi > 0] --create a list with every xi, where xi>0
xi <- x -- this is the generator, it means for every element in x

postivies :: [Int] -> [Int]
positives x = [xi | xi <- x, xi > 0]

cartesian :: [t] -> [t] -> [(t, t)]
cartesian x y = [(xi, yi) | xi <- x, yi <- y] --xi es cada elemento en x, yi es cada elemento en yi, 
                                                -- y en la resulting list hace un match de todas las combinaciones de xi con todas las yi
--uno que sea que la sum sea larger than n, pero sin usar filter (avedá)
cartesianSum :: [Int] -> [Int] -> Int -> [(Int, Int)]
cartesianSum x y n= [(xi, yi) | xi <- x, yi <- y, (xi + yi) > n] 

ocurrences :: Int -> [Int] -> Int
ocurrences n x = lengthº [xi | xi <- x, n == xi] --hace una lista con todos los elementos de x que sean igual a n, dsps sala el length para decir cuantas veces sale total

qSort :: [Int] -> [Int]
qSort [] = []
qSort (first:rest) =
    (qSort leftList) ++ [first] ++ (qSort rightList)
    where
        leftList = [lefti | lefti <- rest, lefti < first]
        rightList = [righti | righti <- rest, righti >= first]

-- Infinite data structures
ones :: [Int]
ones = 1:ones --hace una lista infinita de 1s [1 1 1 1 1 ...

--podemos usarlo con un take
take 5 ones -- [1, 1, 1, 1, 1]

numbersFrom :: Int -> [Int]
numbersFrom n = n:numbersFrom (n+1) --lista con todos los numeros dsps de un num

take 3 (numbersFrom 1000) --[1000, 10001, 10002]

factorialInf :: Int -> Int
factorialInf n = product (take n [1..]) --multiplica los que esten en la lista 1, 2, 3, ... n

factorial 5 --120