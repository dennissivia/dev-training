find_lcm :: [String] -> Int
find_lcm str = myLcm  a' b'
               where a' = read(str !! 0) :: Int
                     b' = read(str !! 1) :: Int
myLcm :: Int -> Int -> Int
myLcm a b = (abs(a) `div` gcdAB) * abs(b)
            where gcdAB = myGcd a b

myGcd :: Int -> Int -> Int
myGcd a 0 = a

myGcd a b = myGcd a' b'
          where a' = b
                b' = a `mod` b

main = do
    input <- getLine
    putStrLn $ show $ find_lcm $ take 2 $ words input
