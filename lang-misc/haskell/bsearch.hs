import Data.List(intercalate, sort)

type Result = [Int]

findAll :: [Int] -> [Int] -> Result
findAll haystack needles = map (bsearch haystack 0 len) needles
  where len = length haystack -1

-- we could use maybe to represent the -1 case,
-- however -1 reflects the requested output of the assignment
bsearch :: [Int] -> Int -> Int -> Int -> Int
bsearch list low high key
  | high < low = -1
  | key == elem = mid
  | key <  elem = bsearch list low (mid -1) key
  | key >= elem = bsearch list (mid +1) high key
  where mid = low + (div (high - low) 2)
        elem = (list!!mid)

printResult :: Result -> IO ()
printResult = putStrLn . intercalate " " . map show

-- the first integer represents the number of elements
-- from the input that should be concidered input
parseInput :: String -> [Int]
parseInput input = take (head ints) $ tail ints
  where ints = map (read) $ words input

main = do
  haystack <- getLine
  needles <- getLine
  printResult $ findAll (parseInput haystack) (parseInput needles)
