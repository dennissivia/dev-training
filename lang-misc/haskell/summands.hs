import Data.List(intercalate, sortBy)

type Result = (Int, [Int])

solveDistinctSummands :: Int -> Result
solveDistinctSummands val = (len, summands)
  where summands = distinctSummands 1 val []
        len = length summands

distinctSummands :: Int -> Int -> [Int] -> [Int]
distinctSummands min remainder akku
  | remainder <= 2*min = remainder:akku
  | otherwise = distinctSummands (min+1) (remainder-min) (min:akku)

-- start with min = 1 and summand-akku = [] and remainder = n,
  -- substract the minimum min that still allows to continue
printResult :: Result -> IO ()
printResult (n, xs) = do
  putStrLn $ show n
  putStrLn $ intercalate " " $ map (show) xs

main = do
  input <- getLine
  printResult $ solveDistinctSummands $ read input
  putStrLn "Done"

