import Control.Monad
import Data.List(sortBy)
import Data.Function(on)

type Item = (Double, Double)

solveKnapsack :: [Item] -> Double -> Double
solveKnapsack items capacity = knapsack items capacity 0

-- The amount of each item must not be > 1 !
-- we might have to use Double for everying
knapsack :: [Item] -> Double -> Double -> Double
knapsack _ 0 totalValue = totalValue
knapsack [] _ totalValue = totalValue
knapsack ((itemValue, itemWeight):rest) capacity totalValue =  knapsack rest capacity' totalValue'
  where capacity' = capacity - factor * itemWeight
        totalValue' = totalValue + factor * itemValue
        factor = if capacity >= itemWeight then 1 else (capacity / itemWeight)

parseInput :: [String] -> [Item]
parseInput strs = sortItems $ map stringToTuple strs

stringToTuple :: String -> (Double, Double)
stringToTuple string = (v, w)
  where v = read(ints!!0) :: Double
        w = read(ints!!1) :: Double
        ints = words string

-- sort items by the value per weight rate in descending (reverse order)
sortItems :: [Item] -> [Item]
sortItems items = reverse $ sortBy (\(a,b) (c, d) -> (a/b) `compare` (c/d)) items

extractN :: String -> Int
extractN = read . head . words

extractCapacity :: String -> Double
extractCapacity = snd . stringToTuple


main = do
  first_line <- getLine
  inputs <- replicateM (extractN first_line) getLine
  putStrLn $ show $ solveKnapsack (parseInput inputs) (extractCapacity first_line)

