data StrictTriple = StrictTriple !Int !Int !Int deriving (Show)
instance Eq StrictTriple where
  (StrictTriple a b c) == (StrictTriple a' b' c') = a == a' && b == b' && c == c'

extractResult :: StrictTriple -> Int
extractResult (StrictTriple a b c) = c

fibonacciStartSequence = StrictTriple 0 1 1

isFibonacciStart :: StrictTriple -> Bool
isFibonacciStart sequence = sequence == fibonacciStartSequence

calcHugeFib :: (Int, Int) -> [Char]
calcHugeFib params  = show result
  where result = pisanoFibonacci params

pisanoFibonacci :: (Int, Int) -> Int
pisanoFibonacci (n, m)
  | n < 2 = 0
  | n < 10 = simpleFib `mod` m -- fallback since its fast and easier
  | otherwise = pisanoFib `mod` m
  where simpleFib = extractResult $ recursiveFibonacci n 3 m fibonacciStartSequence
        pisanoFib = extractResult $ recursiveFibonacci n' 3 m fibonacciStartSequence
        n' = n `mod` cycleLength
        cycleLength = calculateCycleLenth n m

calculateCycleLenth :: Int -> Int -> Int
calculateCycleLenth n m
  | n == 2 = 2
  | n == 3 = 8
  | otherwise = findPeriod 1 m $ StrictTriple 1 1 2

findPeriod :: Int -> Int -> StrictTriple -> Int
findPeriod i m fibTriple
  | isFibonacciStart fibTriple = i
  | otherwise = findPeriod (i+1) m fibs
    where fibs = nextFibs m $ fibTriple

recursiveFibonacci :: Int -> Int -> Int -> StrictTriple -> StrictTriple
recursiveFibonacci n i m fibTriple
  | i > n = fibTriple
  | otherwise = recursiveFibonacci n i' m fibs
      where i' = i+1
            fibs = nextFibs m $ fibTriple

nextFibs :: Int -> StrictTriple -> StrictTriple
nextFibs m (StrictTriple a b c) = StrictTriple b c c'
  where c' = ((b `mod` m) + (c `mod` m)) `mod` m

parseInput :: [String] -> (Int, Int)
parseInput strs = (a, b)
  where a = read (strs!!0) :: Int
        b = read (strs!!1) :: Int

main = do
    input <- getLine
    putStrLn $ calcHugeFib . parseInput $ words input
