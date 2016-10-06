import Data.List(intercalate)

qsort3 :: [Int] -> [Int]
qsort3 [] = []
qsort3 list = (qsort3 left) ++ mid ++ (qsort3 right)
  where (left, mid, right) = partition list pivot
-- for now 776 will be hour random number
        pivotPos = 7777 `mod` length list
        pivot = list!!pivotPos

partition :: [Int] -> Int -> ([Int], [Int], [Int])
partition list pivot = ( smaller, equal, greater )
  where smaller = filter (< pivot) list
        equal   = filter (== pivot) list
        greater = filter (> pivot) list



printResult :: [Int] -> IO ()
printResult = putStrLn . intercalate " " . map (show)

main = do
  n <- getLine
  elements <- getLine
  printResult $ qsort3 $ take (read n) $ map (read) $ words elements
