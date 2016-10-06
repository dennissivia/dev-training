import Data.List
import Control.Monad

toStr :: Int -> String
toStr i = show i

toInt :: String -> Int
toInt str = read str :: Int

toPair :: [Int] -> (Int, Int)
toPair [a,b] = (a,b)

multPair :: (Int, Int) -> Int
multPair (a, b) = a * b

multPair2 :: (Integer, Integer) -> Integer
multPair2 (a,b) = a*b
--
-- solve :: String -> String -> Int
-- solve n numbers = let n' = toInt n
--                       xs = (map toInt) . words $ numbers
--                   in calculate_v2 n' xs

-- calculate :: Int -> [Int] -> Int
-- calculate n xs = product . take 2 $ reverse . sort $ take n xs

-- calculate_v2 :: Int -> [Int] -> Int
-- calculate_v2 n xs = let xs' = sort $ take n xs
--                         in last(init(xs')) * last(xs')
-- third version

solve :: String -> String -> Int
solve n numbers = multPair $ findMaxPair n' xs
                     where n' = toInt n
                           xs = words $ takeWhile (\x -> x /= '\n' ) numbers

-- NOTE we currently do not track if our index in
-- in the fold is higher than max. Actually max is not used
findMaxPair :: Int -> [ String ] -> (Int, Int)
findMaxPair 0 _  = (0,0)
findMaxPair 1 l  = (1,toInt $ head l)
findMaxPair _ [] = (0,0)
findMaxPair max numbers = foldl' selectMax accu numbers
   where accu = (0,0)

selectMax :: (Int, Int) -> String -> (Int, Int)
selectMax (a, b) x = selectMax' (a,b) $ toInt x

selectMax' :: (Int, Int) -> Int -> (Int, Int)
selectMax' (a, b) x
  | x > a = (x, a)
  | x > b = (a, x)
  | otherwise = (a, b)

main = ((liftM2 solve) getLine getContents) >> (putStrLn . show)

