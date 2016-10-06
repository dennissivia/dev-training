data StrictPair = StrictPair !Int !Int deriving (Show)

lastDigit :: Int -> Int
lastDigit x = x `mod` 10

getNthFib :: Int -> [Char]
getNthFib n = show . lastDigit $ extractResult result
  where result = recursiveFibonacci n 2 $ StrictPair 0 1

extractResult :: StrictPair -> Int
extractResult (StrictPair a b) = b

recursiveFibonacci :: Int -> Int -> StrictPair -> StrictPair
recursiveFibonacci n i (StrictPair a b)
  | i > n = StrictPair a b
  | otherwise = recursiveFibonacci n i' $ StrictPair a' b'
  where i' = i+1
        a' = b
        b' = (lastDigit a + lastDigit b)

main = do
    n <- getLine
    putStrLn $ getNthFib(read(n) :: Int)
