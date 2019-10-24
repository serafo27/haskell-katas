module Simple where

bottles :: Int -> String
bottles n 
  | n == 0 = "no more bottles"
  | n == 1 = "1 bottle"
  | otherwise = show n ++ " bottles"

verse :: Int -> String
verse 0   = "No more bottles of beer on the wall, no more bottles of beer.\n"
        ++ "Go to the store and buy some more, 99 bottles of beer on the wall."

verse n   = bottles n ++ " of beer on the wall, " ++ bottles n ++ " of beer.\n"
        ++ "Take one down and pass it around, " ++ bottles (n-1)
                                                ++ " of beer on the wall.\n"

main :: IO()
main = mapM_ (putStrLn . verse) [99,98..0]