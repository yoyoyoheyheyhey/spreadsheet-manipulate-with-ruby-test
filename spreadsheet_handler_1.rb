require 'dotenv/load'
require "google_drive"

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

spreadsheet = session.spreadsheet_by_key(ENV["SPREADSHEET_KEY"])
ws1 = spreadsheet.worksheets.first
ws1["A1"] = "Hello World"
ws1.save