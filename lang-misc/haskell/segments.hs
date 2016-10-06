import Control.Monad(replicateM)
import Data.List(intercalate, sortBy)
import Data.Function(on)
type Segment = (Int, Int)

countSegments :: [Int] -> [Segment] -> [Int]
countSegments points segments = map (count 0 max_pos 0 segments) points
  where max_pos = (length segments) -1

count :: Int -> Int -> Int -> [Segment] -> Int -> Int
count pos max_pos sum segments point
  -- the following segments will not match
  | (fst segment) > point = sum
  | pos > max_pos = sum
  | otherwise = count (pos+1) max_pos sum' segments point
  where segment = segments!!pos
        sum' = if ((snd segment) >= point) then (sum+1) else sum

parseSegments :: [String] -> [Segment]
parseSegments list = map (strToSegment) list

strToSegment :: String -> Segment
strToSegment str = (a,b)
  where a = list!!0
        b = list!!1
        list = map read $ words str

sortSegment :: [Segment] -> [Segment]
sortSegment = sortBy (compare `on` fst)

parsePoints :: String -> [Int]
parsePoints = map read . words

printResult :: [Int] -> IO ()
printResult = putStrLn . intercalate " " . map show

main = do
  first_line <- getLine
  let input = map (read) $ words first_line
  segments <- replicateM (head input) getLine
  points <- getLine
  printResult $ countSegments (parsePoints points) (sortSegment $ parseSegments segments)
