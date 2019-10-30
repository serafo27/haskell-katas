module Birthday where
import Data.List.Split

data Date = Date { year::String, month::String, day::String }

data File = File { file_data::String }
data Employee = Employee { firstName::String, lastName::String, birthday::Date, email::String }
data Email = Email { email_data::String }

loadEmployeeFile :: File -> [Employee]
loadEmployeeFile file = ((map toEmployee) . tail . lines . file_data) file

toEmployee :: String -> Employee
toEmployee content = createEmployee (splitOn "," content)

createEmployee :: [String] -> Employee
createEmployee [first_name,last_name,date,email] = Employee first_name last_name (toDate date) email

toDate :: String -> Date
toDate = fromArray . (splitOn "/")

fromArray :: [String] -> Date
fromArray [year,month,day] = Date year month day

sendEmail :: [Employee] -> [Email]
sendEmail = (map (Email . toEmailContent . firstName)) . (filter isTodayBirthday)

isTodayBirthday :: Employee -> Bool
isTodayBirthday = isBirthday (Date "1982" "10" "08")

isBirthday :: Date -> Employee -> Bool
isBirthday date employee = (((day . birthday) employee) == (day date)) 
                          && (((month . birthday) employee) == (month date)) 

toEmailContent :: String -> String
toEmailContent name = "Subject: Happy birthday!\n\n"++
                      "Happy birthday, dear "++ name ++"!"

sendGreetings :: File -> [Email]
sendGreetings = sendEmail . loadEmployeeFile