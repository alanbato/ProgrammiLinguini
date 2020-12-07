nbElements :: [a] -> Int
nbElements [] = 0
nbElements lst = 1 + nbElements (tail lst)


car :: [a] -> a --no importa que caracter pongas aqui, con que sea lowercase chido
car [] = error "Empty list."
car lst = head lst

myMin :: [Int] -> Int
myMin [] = error "Empty list." --si le mandas lista vacia
myMin [x] = x --si solo queda un elemento, regresas el elemento
myMin lst = if (head lst) < myMin (tail lst) --si no, comparas el car vs el myMin que queda
    then (head lst)
    else myMin (tail lst)

    --myMin con patterns
myMinPattern :: [Int] -> Int
myMinPattern [] = error "Empty list." 
myMinPattern [x] = x  
myMinPattern (first:rest) = let minRest = myMinPattern rest in --usamos el let para calcular solo una vez, en el otro lo sacabas varias veces
    if first < minRest
        then first
        else myMinPattern rest
        -- where minRest = myMinPatterns rest --tmb puedes usar asi, let se declara antes, where después

main = do 
    print $ nbElements [10, 20, 30, 40]
    print $ car [10, 20, 30, 40]
    print $ myMin [10, 20, 30, 40, 2]
    print $ myMinPattern [10, 20, 30, 40, 2]
