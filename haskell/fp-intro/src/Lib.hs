module Lib () where

import qualified Data.Maybe
import Data.List
import Control.Monad
import qualified Data.Char
import qualified Data.Map

-- import qualified Data.Map as Map
-- import Data.Map.Lazy

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
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
    Nothing -> "Oh no"
    Just name -> "Yeah " ++ name


uppercase :: String -> String
uppercase = map Data.Char.toUpper

str = find containsA userNames

fullName :: String -> String -> String
fullName first last = first ++ " " ++ last


fmap2 :: (String -> String -> String) -> Maybe String -> Maybe String -> Maybe String
fmap2 f m1 m2 =
  case m1 of
    Nothing -> Nothing
    Just v1 ->
      case m2 of
        Nothing -> Nothing
        Just v2 -> Just $ f v1 v2

first_ = Just "jane"
last_ = Just "doe"

-- fmap2 full_name first last
