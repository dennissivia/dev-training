import Data.List(intercalate)

printResult :: Int -> IO ()
printResult = putStrLn . show

countInv :: [Int] -> Int
countInv [] = 0
countInv list
  | (length list) < 2 = 0
  | otherwise = (countInv left) + (countInv right) + last (merge left right [] 0)
  where mid = (length list) `div` 2
        (left, right) = splitAt mid list

merge ::  [Int] -> [Int] -> [Int] -> Int -> [Int]
merge [] ys accu sum = (reverse accu) ++ ys ++ [sum]
merge xs [] accu sum = (reverse accu) ++ xs ++ [sum]
merge left@(l:ls) right@(r:rs) accu sum
  | l <= r    = merge ls right (l:accu) sum
  | otherwise = merge left rs  (r:accu) (sum+1)

main = do
  n <- getLine
  elements <- getLine
  -- printResult $ countInv $ take (read n) $ map (read) $ words elements
  putStrLn "Done"
