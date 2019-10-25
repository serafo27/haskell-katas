module BowlingSpec where

import Test.Hspec
import Bowling

spec :: Spec
spec = do

  describe "shoud split string in array of strings" $ do
    it "parse only strike" $
      parse "X X X" `shouldBe` [(1, Strike), (2, Strike), (3, Strike)]

    it "only points" $
      parse "91 64 12" `shouldBe` [(1, Points 9 1), (2, Points 6 4), (3, Points 1 2)]
      
    it "points incomplete" $
      parse "9- -4 1-" `shouldBe` [(1, Points 9 0), (2, Points 0 4), (3, Points 1 0)]

    it "points with spare" $
      parse "9/ 4/ 1/" `shouldBe` [(1, Spare 9), (2, Spare 4), (3, Spare 1)]


  describe "calculate correct point from scores" $ do 
    it "only strike" $
      calculate (allStrike 12) `shouldBe` 300

    it "all miss" $
      calculate (allNineMiss 10) `shouldBe` 90

    it "all miss" $
      calculate (allSpare 11) `shouldBe` 150
        
    it "points incomplete" $
      calculate [(1, Points 9 0), (2, Points 0 4), (3, Points 1 0)] `shouldBe` 14

    it "mix" $
      calculate [(1, Strike), (2, Points 0 4), (3, Points 1 0)] `shouldBe` 15

allStrike :: Int -> [Frame]
allStrike n = [(n, Strike) | n <- [1..n]]


allNineMiss :: Int -> [Frame]
allNineMiss n = [(n, Points 9 0) | n <- [1..n]]

allSpare :: Int -> [Frame]
allSpare n = [(n, Spare 5) | n <- [1..n]]