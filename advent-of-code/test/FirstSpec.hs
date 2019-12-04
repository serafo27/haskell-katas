module FirstSpec where

import Test.Hspec
import First
  
  
spec :: Spec
spec = do
  
  describe "fuelForMass" $ do
    it "fuel needed for a mass" $ do
      fuelForMass 12 `shouldBe` 2

  describe "fuelForFuel" $ do
    it "fuel needed for a mass and the mass of the fuel" $ do
      fuelForFuel 1969 `shouldBe` 966