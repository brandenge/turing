require 'csv'
require './lib/attendee'

puts "EventManager initialized."

contents = CSV.open 'data/event_attendees.csv', headers: true, header_converters: :symbol

attendees = contents.map do |row|
  Attendee.new(row[:id], row[:first_name], row[:last_name], row[:zipcode])
end

pp attendees
