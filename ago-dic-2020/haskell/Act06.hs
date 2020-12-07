enigma01 :: [Char] -> Int
enigma01 [_, 'b', c] = 0
enigma01 (_: 'b': c) = 1
enigma01 lst = 2

enigma02 :: Int -> Int -> [Int] -> Int
enigma02 x y z = length ((x : z) ++ [y])

enigma03 :: [Double] -> Double -> [[Double]]
enigma03 x y = [y] : [x]

enigma04 :: [Double] -> Double -> [Double]
enigma04 x y = x ++ [y]

enigma05 :: Int -> Int -> Int -> Char
enigma05 _ _ n = 'x'
enigma05 0 0 n = 'y'
enigma05 0 0 1 = 'z'

enigma06 :: Int -> Int
enigma06 0 = 1
enigma06 n = enigma06 (n - 1)

enigma07 :: [Char] -> [Char]
enigma07 [] = "y"
enigma07 [x] = "x"
enigma07 (x:y) = "x" ++ enigma07 (tail y)

main = do 
    print $ enigma01 "abcde"
    print $ enigma01 "abc"
    print $ enigma02 1 2 [3, 4, 5]
    print $ enigma03 [1.1, 2.2] 3.3
    print $ enigma04 [1.1, 2.2] 3.3
    print $ enigma05 0 0 1
    print $ enigma06 10
    print $ enigma07 "12345"
    print $ enigma07 "123456"