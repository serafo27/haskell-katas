module Second where

import Data.List.Split

data Opcode = Add       { a1::Int, a2::Int, aPosition::Int } 
            | Multiply  { m1::Int, m2::Int, mPosition::Int } 
            | Stop 

type RawData = [String]
type Tape = [Int]

splitByComma :: String -> RawData
splitByComma = (splitOn ",")

getOpcode :: Tape -> Opcode
getOpcode (1:a:b:pos:xs) = Add a b pos
getOpcode (2:a:b:pos:xs) = Multiply a b pos
getOpcode (99:xs) = Stop

readTape :: String -> Tape
readTape = (map toInt) . splitByComma

execOpcode :: Tape -> Opcode -> Tape
execOpcode t (Add a b pos) = replaceNth pos ((t!!a)+(t!!b)) t
execOpcode t (Multiply a b pos) = replaceNth pos ((t!!a)*(t!!b)) t
execOpcode t Stop = t 

exec :: Int -> Tape -> Tape
exec idx tape
  | isStop opcode = tape
  | otherwise = exec (idx+4) (execOpcode tape opcode)
    where opcode = getOpcode (dropNth idx tape)

main t = exec 0 (readTape t)


-- UTILS --

isStop :: Opcode -> Bool
isStop Stop = True
isStop _ = False 

toInt :: String -> Int
toInt = read

replaceNth :: Int -> a -> [a] -> [a]
replaceNth _ _ [] = []
replaceNth n newVal (x:xs)
  | n == 0 = newVal:xs
  | otherwise = x:replaceNth (n-1) newVal xs

dropNth :: Int -> Tape -> Tape
dropNth idx = snd . splitAt idx

fileContent :: IO String
fileContent = readFile "../res/Second.txt"