import Data.List(intercalate)

printResult :: [Int] -> IO ()
printResult = putStrLn . intercalate " " . map (show)

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right)
  where mid = (length xs) `div` 2
        (left, right) = splitAt mid xs

merge ::  [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge left@(l:ls) right@(r:rs)
  | l <= r = l : merge ls right
  | otherwise = r : merge left rs

main = do
  n <- getLine
  elements <- getLine
  printResult $ mergeSort $ take (read n) $ map (read) $ words elements
