import Control.Monad
import Data.List(sortBy)
import Data.Function(on)
import Data.Ratio

type RatioInt = Ratio Integer
type Item = (RatioInt , RatioInt )

solveKnapsack :: [Item] -> Integer -> Float
solveKnapsack items capacity = fromRational $ knapsack items (capacity % 1) (0 % 1)

-- The amount of each item must not be > 1 !
-- we might have to use Int for everying
knapsack :: [Item] -> RatioInt -> RatioInt -> RatioInt
knapsack _ 0 totalValue = totalValue
knapsack [] _ totalValue = totalValue
knapsack ((itemValue, itemWeight):rest) capacity totalValue =  knapsack rest capacity' totalValue'
  where capacity' = capacity - factor * itemWeight
        totalValue' = totalValue + factor * itemValue
        factor = if capacity >= itemWeight then (1 :: RatioInt) else (capacity / itemWeight)

parseInput :: [String] -> [Item]
parseInput strs = sortItems $ map stringToTuple strs

stringToTuple :: String -> Item
stringToTuple string = (v % 1, w % 1)
  where v = read(ints!!0) :: Integer
        w = read(ints!!1) :: Integer
        ints = words string

-- sort items by the value per weight rate in descending (reverse order)
sortItems :: [Item] -> [Item]
sortItems items = reverse $ sortBy (\(a,b) (c, d) -> (a/b) `compare` (c/d)) items

extractN :: String -> Int
extractN = read . head . words

extractCapacity :: String -> Integer
extractCapacity = read . last . words


main = do
  first_line <- getLine
  inputs <- replicateM (extractN first_line) getLine
  let x = parseInput inputs
  let y = extractCapacity first_line
  let z = solveKnapsack (parseInput inputs) (extractCapacity first_line)
  putStrLn $ show $ solveKnapsack (parseInput inputs) (extractCapacity first_line)

