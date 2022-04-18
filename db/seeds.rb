require 'pry'
# This will delete any existing rows from the Restaurant and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Camping data..."
Campground.destroy_all
Campsite.destroy_all
Reservation.destroy_all
User.destroy_all


puts "🌱 Seeding camps..."

puts "Creating fake users"
users = []
10.times do
	users << User.create(
		name: Faker::Name.name,
        email: Faker::Internet.email
	)
end

puts "Creating fake Campsites"
campsites = []
10.times do
    campsites << Campsite.create(
        site_number: Faker::Number.number(digits: 2),
        has_picnic_table: [true, false].sample,
        has_firepit: [true, false].sample,
        has_bathrooms: [true, false].sample,
        has_rv_hookup: [true, false].sample,
        daily_price: Faker::Number.number(digits: 2)
    )
end

puts "Creating fake Camgrounds"
campgrounds = []
10.times do
    campgrounds << Campground.create(
        campsite_id: campsites.sample.id,
        camp_name: "#{Faker::Mountain.name} campgrounds",
        is_full: [true, false].sample
    )
end

puts "Creating fake Reservations"
10.times do
    start_date = Faker::Date.between(from: '2022-04-18', to: '2023-04-18')
    end_date = Faker::Date.between(from: start_date.strftime('%Y-%m-%d'), to: '2024-04-18')
	Reservation.create(
        user_id: users.sample.id,
        campground_id: campgrounds.sample.id,
        start_date: start_date.strftime('%Y-%m-%d %H:%M'),
        end_date: end_date.strftime('%Y-%m-%d %H:%M'),
        price_total: Faker::Number.number(digits: 2)
	)
end

puts "✅ Done seeding!"