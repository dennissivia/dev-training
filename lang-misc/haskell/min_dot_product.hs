import Data.List(sort)

solveMinDotProduct :: Int -> [Int] -> [Int] -> Int
solveMinDotProduct n as bs = foldr (+) 0 productList
  where productList = minDotProduct as' bs' []
        as' = sort $ take n as
        bs' = reverse $ sort $ take n bs

minDotProduct :: [Int] -> [Int] -> [Int] -> [Int]
minDotProduct [] _ akku = akku
minDotProduct _ [] akku = akku
minDotProduct (a:as) (b:bs) akku = minDotProduct as bs (a*b:akku)

stringToList :: String -> [Int]
stringToList = map read . words

main = do
  elements <- getLine
  as <- getLine
  bs <- getLine
  putStrLn $ show $ solveMinDotProduct (read elements :: Int) (stringToList as ) (stringToList bs)
