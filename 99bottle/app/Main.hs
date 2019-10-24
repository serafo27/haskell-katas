module Main where

import Phrases

main :: IO ()
main = do
  putStrLn "99 bottle of beer.\n"
  mapM_ (putStrLn . printPhrase . Verse) [1..100]
