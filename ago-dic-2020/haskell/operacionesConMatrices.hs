add :: [[Double]] ->[[Double]] -> [[Double]]
add [] [] = []
add (xf:xr) (yf:yr) = (map (\(x, y) -> x + y) (zip xf yf)) : add xr yr

transpose :: [[Double]] -> [[Double]]
transpose ([]:_) = []
transpose m = (map head m) : transpose (map tail m)

multiplyRow :: [Double] -> [[Double]] -> [Double]
multiplyRow _ [] = []
multiplyRow v (m:ms) = sum (map (\(x, y) -> x * y) (zip v m)) : multiplyRow v ms

multiply :: [[Double]] ->[[Double]] -> [[Double]]
multiply [] _ = []
multiply (first:rest) m = (multiplyRow first (transpose m)) : (multiply rest m)

myMap :: (a -> b) -> [a] -> [b] --(a -> b) aka una funcion que recibe algo de tipo genérico y regresa algo de tipo genérico (elementos) --a y b pueden ser igual o diferente tipo
myMap _ [] = []
myMap f (h:t) = (f h) : myMap f t

main = do
    print $ add [[1,2,3], [4,5,6]] [[10,20,30], [40,50,60]] --[[11.0, 22.0, 33.0], [44.0, 55.0, 66.0]]
    print $ transpose [[1, 2, 3, 4], [5, 6, 7, 8]] -- [[1.0,5.0],[2.0,6.0],[3.0,7.0],[4.0,8.0]]
    print $ multiply [[1, 5, 6], [10, 2, 8]] [[4, 2, 1], [9, 6, (-2)], [17, 5, (-3)]] -- [[151.0,62.0,-27.0],[194.0,72.0,-18.0]]
    print $ myMap sqrt [25, 81, 100]