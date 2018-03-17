module HW8 where

    transpose :: [[Int]] -> [[Int]]
    transpose ([]:xs) = []
    transpose mat = (map head mat) : (transpose(map tail mat))

    rowMat :: [Int] -> [[Int]] -> [Int]
    rowMat x [] = []
    rowMat x (y:ys) = sum (map (\(x,y) -> x * y) (zip x y)) : rowMat x ys

    matMul :: [[Int]] -> [[Int]] -> [[Int]]
    matMul ([]:xs) y = []
    matMul x y = map (\x -> rowMat x (transpose y)) x
    
    meanHeight :: [(String, Float)] -> [(String, Float)]
    meanHeight tbl = [(fst (head tbl), ((sum (map snd tbl)) / fromIntegral(length tbl)))]

    -- [("Male", 175), ("Female",150), ...]
    summarize :: [(String, Float)] -> [(String, Float)]
    summarize tbl = (meanHeight (filter (\(x,y) -> x == "Male") tbl)) ++
                    (meanHeight (filter (\(x,y) -> x == "Female") tbl))

    smallerThan :: [(String, Float)] -> Float -> [(String, Float)]
    smallerThan [] n = []
    smallerThan (x:xs) n
                    | (snd x) < n = x : (smallerThan xs n)
                    | otherwise = (smallerThan xs n)
    
    data Node = Node Int | String deriving (Show)
    data DGraph = DGraph [(Node, [Node])] deriving (Show)
    maxDegree :: DGraph -> (Node, Int)
    maxDegree (DGraph []) = error "maxDegree on empty graph is not defined"
    maxDegree (DGraph [(node, edges)]) = (node, length edges)
    maxDegree (DGraph ((node, edges):xs))
                        | (length edges) >= (snd other) = (node, length edges)
                        | otherwise = other
                        where other = maxDegree (DGraph xs)


    pathExists :: Node -> Node -> DGraph -> Bool
    pathExists n1 n2 dgph = error "https://goo.gl/BYw7Fm"