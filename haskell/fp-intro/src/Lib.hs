module Lib (strToUpper, fullName, runUserExample) where

import qualified Data.Map
import           Data.List
import qualified Data.Char
import Control.Monad

data Person = Person { firstName :: String
                     , lastName  :: String
                     , age       :: Int
                     } deriving (Show)

data Address = Address { street :: String
                       , number :: Int
                       } deriving (Show)

type Id = Int

getUserId :: Maybe Int
getUserId = Just 100


loadUser :: Id -> Maybe Person
loadUser userId =
  let
    age' = userId
  in
    Just (Person {firstName = "Jane", lastName = "Doe", age = age'})

loadAddress :: Int -> Maybe Address
loadAddress _ =
  Just (Address {street = "Elmstreet", number = 10})

userNames :: [String]
userNames = ["alice","bob","carol","david","eve", "evil"]

containsA :: String -> Bool
containsA = isInfixOf "a"

checkMaybe :: Maybe String -> String
checkMaybe m =
  case m of
    Nothing   -> "Oh no"
    Just name -> "Yeah " ++ name

strToUpper :: String -> String
strToUpper = map Data.Char.toUpper

fullName :: String -> String -> String
fullName f l = f ++ " " ++ l


fmap2 :: (String -> String -> String) -> Maybe String -> Maybe String -> Maybe String
fmap2 f m1 m2 =
  case m1 of
    Nothing -> Nothing
    Just v1 ->
      case m2 of
        Nothing -> Nothing
        Just v2 -> Just $ f v1 v2

first_ :: Maybe String
first_ = Just "jane"

last_ :: Maybe String
last_ = Just "doe"

str :: Maybe String
str = find containsA userNames

runUserExample :: Maybe String
runUserExample = fmap2 fullName first_ last_

freq :: [String] -> Data.Map.Map Char Int
freq xs =
  let
    grouped = groupBy (\x y -> (head x) == (head y)) $ sort xs
    counted = map (\l -> (head $ head l, length l)) grouped
  in
    Data.Map.fromList counted

freq2 :: [String] -> Data.Map.Map Char [[Char]]
freq2 xs =
  let
    grouped = groupBy (\x y -> (head x) == (head y)) $ sort xs
    paired  = map (\l -> (head $ head l, l)) grouped
  in
    Data.Map.fromList paired

animals :: IO [String]
animals = (liftM words) $ readFile "animals.txt"
