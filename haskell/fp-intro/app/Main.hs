module Main where
import Control.Monad
import Lib


splitData = words

reduceData = unwords

mapData :: [String] -> [String]
mapData xs = map (\x -> "dummy") xs

getAnimals = getContents

main :: IO ()
main =
  let
    f = reduceData . mapData . splitData
  in
    fmap f getAnimals >>= putStrLn
    -- putStrLn "foo"
