import Data.List(sort)

hasMajority :: [Int] -> Bool
hasMajority list = isMajority list $ medium list

isMajority :: [Int] -> Int -> Bool
isMajority list x = (length matches) *2 > (length list)
 where matches = (filter (== x) list )

medium :: [Int] -> Int
medium list = list'!!mid
  where list' = sort list
        mid = (length list') `div` 2

printResult :: Bool -> IO ()
printResult True = putStrLn "1"
printResult False = putStrLn "0"

main = do
  n <- getLine
  elements <- getLine
  printResult $ hasMajority $ take (read n) $ map (read) $ words elements
