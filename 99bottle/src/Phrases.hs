module Phrases where 

data Bottle = Bottle { num :: Int }
data Verse = Verse { verse_num :: Int }
data TemplateData = TemplateData { currentBottles :: String, action :: String, remainingBottles :: String }

data NthPhrase = NthPhrase { bottle :: Bottle }
data ThirdLastPhrase = ThirdLastPhrase
data SecondLastPhrase = SecondLastPhrase
data LastPhrase = LastPhrase 

class PrintablePhrase a where
  get :: a -> TemplateData

instance PrintablePhrase NthPhrase where
  get p = TemplateData { currentBottles= bottleNum p ++ " bottles",
                         action="Take one down and pass it around",
                         remainingBottles= nextBottleNum p ++ " bottles" }
          
instance PrintablePhrase ThirdLastPhrase where
  get p = TemplateData { currentBottles= "2 bottles",
                         action="Take one down and pass it around",
                         remainingBottles="1 bottle" }

instance PrintablePhrase SecondLastPhrase where
  get p = TemplateData { currentBottles="1 bottle",
                         action="Take it down and pass it around",
                         remainingBottles="no more bottles" }

instance PrintablePhrase LastPhrase where
  get p = TemplateData { currentBottles="No more bottles",
                         action="Go to the store and buy some more",
                         remainingBottles="99 bottles" }

template :: TemplateData -> String
template d = currentBottles d ++ " of beer on the wall, " ++ currentBottles d ++ " of beer.\n" ++
              action d ++ ", " ++ remainingBottles d ++ " of beer on the wall.\n"

bottleNum :: NthPhrase -> String
bottleNum = show . num . bottle

nextBottleNum :: NthPhrase -> String
nextBottleNum = show . (subtract 1) . num . bottle

verseToBottle :: Verse -> Bottle
verseToBottle v = Bottle $ (100 - (verse_num v))

printPhrase :: Verse -> String
printPhrase v
  | verse_num v == 100 = useTemplate LastPhrase 
  | verse_num v == 99 = useTemplate SecondLastPhrase 
  | verse_num v == 98 = useTemplate ThirdLastPhrase
  | otherwise = useTemplate (NthPhrase $ verseToBottle v)

useTemplate :: (PrintablePhrase a) => a -> String
useTemplate = template . get