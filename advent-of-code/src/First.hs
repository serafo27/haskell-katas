module First where

import System.Environment

type Fuel = Int
type Mass = Int

fuelForMass :: Mass -> Fuel
fuelForMass = (subtract 2) . (`div` 3)

fuelForFuel :: Fuel -> Fuel
fuelForFuel fuel 
  | extraFuel <= 0 = 0
  | otherwise = extraFuel + (fuelForFuel extraFuel)
  where extraFuel = fuelForMass fuel

toFuel :: [Mass] -> [Fuel]
toFuel = map fuelForMass

toFullFuel :: [Mass] -> [Fuel]
toFullFuel = map fuelForFuel

puzzle1 :: IO Fuel
puzzle1 = exec toFuel

puzzle2 :: IO Fuel
puzzle2 = exec toFullFuel

-- UTILS --

exec :: ([Mass] -> [Fuel]) -> IO Fuel
exec f = fmap (sum . f . toIntArray . lines) fileContent


fileContent :: IO String
fileContent = readFile "../res/First.txt"

toInt :: String -> Int
toInt = read

toIntArray :: [String] -> [Int]
toIntArray = map toInt