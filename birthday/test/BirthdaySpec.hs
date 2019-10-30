module BirthdaySpec where

import Test.Hspec
import Birthday

spec :: Spec
spec = do
  
  describe "birthday" $ do
    it "load employee" $ do
      let content = "last_name, first_name, date_of_birth, email\n"++
                        "Doe, John, 1982/10/08, john.doe@foobar.com\n"++
                        "Ann, Mary, 1975/09/11, mary.ann@foobar.com"

      let employees = loadEmployeeFile $ File content
      length employees `shouldBe` 2

    it "filter employees by birthdate" $ do
      let employees = [Employee "John" "Doe" (Date "1982" "10" "08") "john.doe@foobar.com",
                        Employee "Patty" "Smith" (Date "1982" "11" "08") "patty.smith@foobar.com"]

      let filtered = sendEmail employees
      length filtered `shouldBe` 1

    it "main test" $ do
      let content = "last_name, first_name, date_of_birth, email\n"++
                        "Doe, John, 1982/10/08, john.doe@foobar.com\n"++
                        "Ann, Mary, 1975/09/11, mary.ann@foobar.com"

      let greetings = sendGreetings $ File content
      length greetings `shouldBe` 1
    