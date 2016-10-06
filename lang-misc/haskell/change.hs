availableUnits = [10, 5, 1]

changeMoney :: Int -> Int
changeMoney money = countCoins money 0 availableUnits

countCoins :: Int -> Int -> [Int] -> Int
countCoins 0 coins _ = coins
countCoins money coins (unit:units) = countCoins newMoney newCoins units
  where newCoins = coins + coins'
        newMoney = money - (coins' * unit)
        coins'   = money `div` unit

main = do
    input <- getLine
    putStrLn $ show $ changeMoney(read input :: Int)
