require 'dotenv/load'
require "google_drive"
require "faker"

session = GoogleDrive::Session.from_service_account_key("client_secret.json")
spreadsheet = session.spreadsheet_by_key(ENV["SPREADSHEET_KEY"])
ws2 = spreadsheet.worksheets.find{|sheet| sheet.title == "ws2"}
list = ws2.list

# write
10.times do |n|
  list.set(n, "Name", Faker::Name.name)
  list.set(n, "Email", Faker::Internet.email)
end
ws2.save

# read
list.get(1, "Name")
names = list.map{|list_row| list_row["Name"] }
puts names
