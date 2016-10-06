find_gcd :: [String] -> Int
find_gcd str = myGcd  a' b'
               where a' = read(str !! 0) :: Int
                     b' = read(str !! 1) :: Int

myGcd :: Int -> Int -> Int
myGcd a 0 = a

myGcd a b = myGcd a' b'
          where a' = b
                b' = a `mod` b

main = do
    input <- getLine
    putStrLn $ show $ find_gcd $ take 2 $ words input
