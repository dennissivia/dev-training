module Examples () where

import Data.List


test :: Int -> Int -> Int -> Int
test a b c = a + b + c

ellipsis :: Int -> String  -> String
ellipsis max str =
  if length str > max then
    "too long"
  else
    str
