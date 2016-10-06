import Data.List(foldl')

lastDigit :: Int -> Int
lastDigit x = x `mod` 10

getNthFib :: Int -> [Char]
getNthFib n = show $ lastDigit $ head $ reverseFibonacci(n)

reverseFibonacci :: Int -> [Int]
reverseFibonacci n = foldl' calcFib akku indices
                      where akku = [1,0]
                            indices = [2..n]

-- using !! over head saves needless copies
calcFib :: [Int] -> Int -> [Int]
calcFib akku elem = lastDigit(akku!!0) + lastDigit(akku!!1) : akku

main = do
    n <- getLine
    putStrLn $ getNthFib(read(n) :: Int)
