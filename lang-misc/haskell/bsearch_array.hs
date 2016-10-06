import Data.List(intercalate)
import Data.Array

type Result = [Int]

findAll :: [Int] -> [Int] -> Result
findAll haystack needles = map (bsearch haystack_array 0 len) needles
  where len = length haystack -1
        haystack_array = (array (0, len) $ zip [0..len] haystack)

-- we could use maybe to represent the -1 case,
-- however -1 reflects the requested output of the assignment
bsearch :: Array Int Int -> Int -> Int -> Int -> Int
bsearch ary low high key
  | high < low = -1
  | key == elem = mid
  | key <  elem = bsearch ary low (mid -1) key
  | key >= elem = bsearch ary (mid +1) high key
  where mid = low + (div (high - low) 2)
        elem = (ary!mid)

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
