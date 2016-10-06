
calculate :: String -> Integer
calculate input = sum $ map (\x -> read x :: Integer ) $ words input

int2str :: Integer -> String
int2str i = show i

solve :: String -> String
solve numbers = int2str $ calculate numbers

main = do
    number_string <- getLine
    putStrLn $ solve number_string
