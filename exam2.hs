module HW8 where
  listLast :: [t] -> t
  listLast (x:xs) = if null xs then x else listLast xs

  myButLast :: [t] -> t
  myButLast (x:xs) = if null (tail xs) then x else myButLast xs

  elementAt :: [t] -> Int -> t
  elementAt (x:xs) i = if i == 1 then x else elementAt xs (i - 1)

  myLength :: [t] -> Int
  myLength (x:xs) = if null xs then 1 else 1 + myLength xs

  myReverse :: [t] -> [t]
  myReverse [] = []
  myReverse (x:xs) = (myReverse xs) ++ [x]

  isPalindrome :: (Eq t) => [t] -> Bool
  isPalindrome x = x == (myReverse x)

  compress :: [Char] -> [Char]
  compress [] = []
  compress [x] = [x]
  compress (x:xs) = if x == head xs then compress xs else x : compress xs

  pack :: [[Char]] -> [[Char]]
  pack [] = []
  pack [x] = [x]
  pack (x:xs) = if x == head xs then [x ++ head xs] : pack xs else pack xs