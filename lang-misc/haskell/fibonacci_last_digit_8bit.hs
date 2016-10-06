import Data.Word

lastDigit :: Word8 -> Word8
lastDigit x = x `mod` 10

getNthFib :: Int -> [Char]
getNthFib n = show . lastDigit $ snd result
  where result = recursiveFibonacci n 2 (0, 1)

recursiveFibonacci :: Int -> Int -> (Word8, Word8) -> (Word8, Word8)
recursiveFibonacci n i (a,b)
  | i > n = (a,b)
  | otherwise = recursiveFibonacci n i' (a', b')
  where a' = b
        b' = (lastDigit a + lastDigit b)
        i' = i+1

main = do
    n <- getLine
    putStrLn $ getNthFib(read(n) :: Int)
