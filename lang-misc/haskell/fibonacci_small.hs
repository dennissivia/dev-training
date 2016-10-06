import Data.List

getNthFib :: Integer -> Integer
getNthFib n = head(reverseFibonacci(n))

reverseFibonacci :: Integer -> [Integer]
reverseFibonacci 0 = [0]
reverseFibonacci 1 = [1]
reverseFibonacci n = foldl calcFib akku indices
                      where akku = [1,0]
                            indices = [2..n]

calcFib :: [Integer] -> Integer -> [Integer]
calcFib akku elem = head akku + head(tail(akku)) : akku

main = do
    n <- getLine
    putStrLn $ show(getNthFib(read(n) :: Integer))
