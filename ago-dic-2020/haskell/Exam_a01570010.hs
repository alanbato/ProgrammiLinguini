-- Roberta González Garza A01570010
-- ====================
-- Complete the following functions and submit your file to Canvas.
-- ====================
-- Do not change the names of the functions. 
-- Do not change the number of arguments in the functions.
-- If your file cannot be loaded by the Haskell compiler, your submission may be cancelled. 
-- Then, submit only code that works.
-- ====================
-- Grading instructions:
-- There is a series of test cases for each function. In order to state that your function
-- "works as described", your output must be similar to the expected one in each case.

-- === gcd ===

gcdx :: Int -> Int -> Int
gcdx a 0 = a
gcdx a b = gcdx b (mod a b)

-- === geom ===

geom :: [Int] -> Bool
geom (first:[]) = True
geom (first:rest) = if ((head rest) == (first * 2))
    then geom rest
    else False

-- === multiples ===

multiplesAux :: [Int] -> Int -> [Int]
multiplesAux [] _ = []
multiplesAux (first:rest) x = if  (mod first x) == 0
                        then first : (multiplesAux rest x)
                        else (multiplesAux rest x)

multiples :: [[Int]] -> Int -> [Int]
multiples [] _ = []
multiples (first:rest) x = (multiplesAux first x) ++ (multiples rest x)

-- === select ===

data Entry = Entry [Char] [Char] deriving Show
-- res: ("age",["24","23","19"])

getDict :: Entry -> [Char]
getDict (Entry d _) = d

getValue :: Entry -> [Char]
getValue (Entry _ v) = v

--[(Entry "name" "Charles"), (Entry "age" "24")]
getVals :: [Entry] -> [Char] -> [Char]
getVals [] _ = []
getVals (first:rest) key = if (getDict first) == key
                            then getValue first 
                            else getVals rest key


--[[(Entry "name" "Charles"), (Entry "age" "24")], 
-- [(Entry "age" "23"), (Entry "name" "Mary"), (Entry "lastName" "Danvers"), (Entry "gender" "female")], 
-- [(Entry "name" "Caroline"), (Entry "lastName" "Ortiz"), (Entry "age" "19")]
--]
selectAux :: [[Entry]] -> [Char] -> [[Char]]
selectAux [] _ = []
selectAux (first:rest) key = (getVals first key) : (selectAux rest key)

--[[(Entry "name" "Charles"), (Entry "age" "24")], 
-- [(Entry "age" "23"), (Entry "name" "Mary"), (Entry "lastName" "Danvers"), (Entry "gender" "female")], 
-- [(Entry "name" "Caroline"), (Entry "lastName" "Ortiz"), (Entry "age" "19")]
--]    "age"
select :: [[Entry]] -> [Char] -> ([Char], [[Char]])
select lst key = (key, filter (/= "") (selectAux lst key))


-- === sold ===

sold :: Int -> [(Int, [(Int, Int)])] -> Int
sold _ _ = error "Not yet implemented\n"

-- === Test cases ===

main = do
    print "=== gcdx ==="
    print $ gcdx 25 3 -- 1
    print $ gcdx 826 18 -- 1
    print $ gcdx 2032 274 -- 2
    print $ gcdx 3335 23 -- 23
    --print "=== fold ==="
    --print $ fold [10, 20, 30, 40, 50] -- [(10,50),(20,40)]
    --print $ fold [3, -8, 2, -2, 6, 4] -- [[(3,4),(-8,6),(2,-2)]]
    print "=== geom ==="
    print $ geom [3, 6, 12, 24, 48] -- True
    print $ geom [1, 2, 4, 8, 16, 32, 64] -- True
    print $ geom [5, 10, 15, 30, 60] -- False
    print $ geom [0, 0, 0, 0, 0] -- True
    print "=== multiples ==="
    print $ multiples [[11, 22, 33], [44, 55, 66], [77, 88, 99]] 2 -- [22,44,66,88]
    print $ multiples [[11, 22, 33], [44, 55, 66], [77, 88, 99]] 3 -- [33,66,99]
    print $ multiples [[11, 22, 33], [44, 55, 66], [77, 88, 99]] 5 -- [55]
    --print "=== mfuse ==="
    --print $ mfuse [[('a', 'b'), ('c', 'd')], [('e', 'f'), ('g', 'h')]] -- [["ab","cd"],["ef","gh"]]
    --print $ mfuse [[('a', 'A'), ('b', 'B'), ('c', 'C')], [('d', 'D'), ('e', 'E'), ('f', 'F')], [('g', 'G'), ('h', 'H'), ('i', 'I')]] -- [["aA","bB","cC"],["dD","eE","fF"],["gG","hH","iI"]]
    print "=== select ==="
    print $ select [[(Entry "name" "Charles"), (Entry "age" "24")], [(Entry "age" "23"), (Entry "name" "Mary"), (Entry "lastName" "Danvers"), (Entry "gender" "female")], [(Entry "name" "Caroline"), (Entry "lastName" "Ortiz"), (Entry "age" "19")]] "age" -- ("age",["24","23","19"])
    print $ select [[(Entry "name" "Charles"), (Entry "age" "24")], [(Entry "age" "23"), (Entry "name" "Mary"), (Entry "lastName" "Danvers"), (Entry "gender" "female")], [(Entry "name" "Caroline"), (Entry "lastName" "Ortiz"), (Entry "age" "19")]] "phone" -- ("phone",[])
    print $ select [[(Entry "name" "Charles"), (Entry "age" "24")], [(Entry "age" "23"), (Entry "name" "Mary"), (Entry "lastName" "Danvers"), (Entry "gender" "female")], [(Entry "name" "Caroline"), (Entry "lastName" "Ortiz"), (Entry "age" "19")]] "lastName" -- ("lastName",["Danvers","Ortiz"])
    --print "=== sold ==="
    --print $ sold 2 [(105, [(10, 3), (4, 2), (9, 3)]), (106, [(6, 4), (8, 1), (4, 6)]), (107, [(9, 7), (12, 1), (14, 1), (10, 4)]), (108, [(4, 1)]), (109, [(7, 21), (10, 4), (14, 6), (5, 3)])] -- 0
    --print $ sold 9 [(105, [(10, 3), (4, 2), (9, 3)]), (106, [(6, 4), (8, 1), (4, 6)]), (107, [(9, 7), (12, 1), (14, 1), (10, 4)]), (108, [(4, 1)]), (109, [(7, 21), (10, 4), (14, 6), (5, 3)])] -- 10
    --print $ sold 10 [(105, [(10, 3), (4, 2), (9, 3)]), (106, [(6, 4), (8, 1), (4, 6)]), (107, [(9, 7), (12, 1), (14, 1), (10, 4)]), (108, [(4, 1)]), (109, [(7, 21), (10, 4), (14, 6), (5, 3)])] -- 11
    --print $ sold 14 [(105, [(10, 3), (4, 2), (9, 3)]), (106, [(6, 4), (8, 1), (4, 6)]), (107, [(9, 7), (12, 1), (14, 1), (10, 4)]), (108, [(4, 1)]), (109, [(7, 21), (10, 4), (14, 6), (5, 3)])] -- 7
