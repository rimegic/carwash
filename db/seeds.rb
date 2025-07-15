# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Generate dummy daily signups for the last 30 days
puts "Generating dummy daily signups..."
(0..29).each do |i|
  date = Date.current - i.days
  count = rand(5..50) # Random signups between 5 and 50 per day
  DailySignup.find_or_create_by!(date: date) do |ds|
    ds.count = count
  end
end
puts "Dummy daily signups generated!"
