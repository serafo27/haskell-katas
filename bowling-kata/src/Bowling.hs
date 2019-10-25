module Bowling where

import Data.Char (digitToInt)
import Data.List.Split (splitOn)

toInt = digitToInt

data Score = Strike | Points Int Int | None | Spare Int
  deriving (Eq, Show)

type Frame = (Int, Score)

parse :: String -> [Frame]
parse s = (zip [1..]) . (map toScore) $ framesString s

framesString :: String -> [String]
framesString = splitOn " "

toScore :: String -> Score
toScore "X"          = Strike
toScore (x:"/")      = Spare (toInt x)
toScore (x:"-")      = Points (toInt x) 0
toScore ('-':xs)     = Points 0 (toInt (head xs))
toScore s
  | length s == 2    = Points (toInt (head s)) (toInt (last s))
  | otherwise        = None

calculate :: [Frame] -> Int
calculate [] = 0

calculate ((n, Strike):rest@((_, Strike):(_, Strike):xs))
  | n <= 10 = 30 + calculate rest
  | otherwise = 0
calculate ((n, Strike):xs) 
  | n <= 10 = 10 + calculate xs

calculate ((_, Points a b):xs) = (a+b) + calculate xs

calculate ((n, Spare _):rest@((_, Spare k):xs)) = (10+k) + calculate rest
calculate ((_, Spare k):rest@((_, Strike):xs)) = (10+10) + calculate rest
calculate ((_, Spare k):rest@((_, Points n _):xs)) = (10+n) + calculate rest

calculate _ = 0