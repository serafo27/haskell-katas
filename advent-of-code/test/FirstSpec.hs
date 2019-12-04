module FirstSpec where

import Test.Hspec
import First
  
  
spec :: Spec
spec = do
  
  describe "fuelFor" $ do
    it "fuel needed for a mass" $ do
      fuelFor 12 `shouldBe` 2

  describe "totalFuelFor" $ do
    it "fuel needed for a mass and the mass of the fuel" $ do
      fullFuelFor 1969 `shouldBe` 966