module PhrasesSpec where

import Test.Hspec
import Phrases


spec :: Spec
spec = do
  
  describe "phrases" $ do
    it "99nth phrase" $ do
      let phrase = NthPhrase $ Bottle 99
      get phrase `shouldBe` "99 bottles of beer on the wall, 99 bottles of beer.\n" ++
                            "Take one down and pass it around, 98 bottles of beer on the wall.\n"

    it "third last phrase" $ do
      let phrase = ThirdLastPhrase
      get phrase `shouldBe` "2 bottles of beer on the wall, 2 bottles of beer.\n" ++
                            "Take one down and pass it around, 1 bottle of beer on the wall.\n"

    it "second last phrase" $ do
      let phrase = SecondLastPhrase
      get phrase `shouldBe` "1 bottle of beer on the wall, 1 bottle of beer.\n" ++
                            "Take it down and pass it around, no more bottles of beer on the wall.\n"

    it "last phrase" $ do
      let phrase = LastPhrase
      get phrase `shouldBe` "No more bottles of beer on the wall, no more bottles of beer.\n" ++
                            "Go to the store and buy some more, 99 bottles of beer on the wall."
