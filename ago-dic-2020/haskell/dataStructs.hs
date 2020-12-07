--Int y[Int] no son lo mismo, si toma las listas como un tipo deferente
--tuples: (1, 'a', [10, 20, 30]) guardan juntos cosas de tipos diferentes, van dentro de () y se separan con ,
    -- [] , = list
    -- () , = tuple
    -- () : = pattern
    -- () spaces = datat type
--pair: tuple with 2 elements, puedes usas fst y snd (son built-in functions que te traen el primero o segundo) SOLO jala en tuples de 2 elementos
--Sequences: [1..5] = [1,2,3,4,5] poner .. entre los números nos da una secuencia, si hay un patrón que identifica, lo sigue 

--Lists to represent STACKS
push :: t -> [t] -> [t]
push x [] = [x]
push x y = x:y

pop :: [t] -> [t]
pop [] = []
pop(_:y) = y

peek :: [t] -> t
peek [] = error "The stack is empty."
peek (x:_) = x

--Lists to represent QUEUES
insert :: t -> [t] -> [t]
insert x [] = [x]
insert x y = y ++ [x]

remove :: [t] -> t
remove [] = []
remove (_:y) = y

first :: [t] -> t
first [] = error "The queue is empty."
first (x:_) = x

--MATRIX: List of lists of _type_, by row or by column

--TABLES: we use tuples to represent records ("a01570010", "Roberta", "Gonzalez", 100)
    --a table is a list of records [(record1), (record2), (recordN)] en todos los casos tienes la misma estructura, string string string int (o whatevs)

getGrade :: Int -> [(Int, [Char], [Char], Int)] -> Int
getGrade _ [] = error "The student id is not in the table"
getGrade x ((id, _, _, grade):rest) = if x == id
                                    then grade
                                    else getGrade x rest

getName :: Int -> [(Int, [Char], [Char], Int)] -> [([Char], [Char])]
getName _ [] = []
getName x ((_, name, lastName, grade) : rest) = if grade >= x
    then (lastName, name) : getName x rest
    else getName x rest

--User-defined data types
--we yse the keyword data to create new data tyoes
data Logical = T | F
--Add deriving Show to be able to print the datatype on
data LogicalPrintable = T | F deriving Show

-- dataType Point, que recibe dos doubles (x y)
data Point = Point Double Double deriving Show
-- dataType Circle, que recibe dos doubles (x y) y un double (radio)
data CircleSimple = CircleSimple Double Double Double deriving Show
-- pero ya tenemos un point que tiene (x,y), entonces
data Circle = Circle Point Double deriving Show
data Rectangle = Rectangle Point Point
--polymorphism in haskell:
data Shape = Circle Point Double | Rectangle Point Point

--How to use: (estos se ponen antes, obvio)
getX :: Point -> Double
getX (Point x _) = x

getY :: Point -> Double
getY (Point _ y) = y

area :: Shape -> Double
area (Circle _ r) = pi * (r * r) --matchea que el tipo sea un círculo
area (Rectangle p0 p1) = abs(getX p0 - getX p1) *  --matchea que el tipo sea un rectangulo
                         abs(getY p0 - getY p1)

--una approach al getName usando datatype
data Record = Record Integer [Char] [Char] Integer
--getNameDataType
--getName :: Int -> [(Int, [Char], [Char], Int)] -> [([Char], [Char])]
getNameDT :: Int -> [Record] -> [([Char], [Char])]
getNameDT _ [] = []
--getName x ((_, name, lastName, grade) : rest) = if grade >= x
getNameDT x ((Record _ name lastName grade) : rest) = if grade >= x --ya no tiene comas, se especifica que es record al principio
    then (lastName, name) : getName x rest
    else getName x rest