module Phrases where 

data Bottle = Bottle { num :: Int }
data Verse = Verse { verse_num :: Int }

data NthPhrase = NthPhrase { bottle :: Bottle }
data ThirdLastPhrase = ThirdLastPhrase
data SecondLastPhrase = SecondLastPhrase
data LastPhrase = LastPhrase 

class PrintablePhrase a where
  get :: a -> String

instance PrintablePhrase NthPhrase where
  get p = bottleNum p ++ " bottles of beer on the wall, " ++ bottleNum p ++ " bottles of beer.\n" ++
          "Take one down and pass it around, " ++ nextBottleNum p ++ " bottles of beer on the wall.\n"
          
instance PrintablePhrase ThirdLastPhrase where
  get p = "2 bottles of beer on the wall, 2 bottles of beer.\n" ++
          "Take one down and pass it around, 1 bottle of beer on the wall.\n"

instance PrintablePhrase SecondLastPhrase where
  get p = "1 bottle of beer on the wall, 1 bottle of beer.\n" ++
          "Take it down and pass it around, no more bottles of beer on the wall.\n"

instance PrintablePhrase LastPhrase where
  get p = "No more bottles of beer on the wall, no more bottles of beer.\n" ++
          "Go to the store and buy some more, 99 bottles of beer on the wall."

bottleNum :: NthPhrase -> String
bottleNum = show . num . bottle

nextBottleNum :: NthPhrase -> String
nextBottleNum = show . (subtract 1) . num . bottle

verseToBottle :: Verse -> Bottle
verseToBottle v = Bottle $ (100 - (verse_num v))

printPhrase :: Verse -> String
printPhrase v
  | verse_num v == 100 = get LastPhrase 
  | verse_num v == 99 = get SecondLastPhrase 
  | verse_num v == 98 = get ThirdLastPhrase
  | otherwise = get (NthPhrase $ verseToBottle v)