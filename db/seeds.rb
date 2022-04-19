require 'pry'
# This will delete any existing rows from the Restaurant and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Camping data..."
Campground.destroy_all
Campsite.destroy_all
Reservation.destroy_all
User.destroy_all

# ***************** User story *********************
# Create a user that user has a reservation for a campground to a specific campsite
puts "Creating User data for a user (Marc) who has two reservations"
start_date = Faker::Date.between(from: '2022-04-18', to: '2023-04-18')
end_date = Faker::Date.between(from: start_date.strftime('%Y-%m-%d'), to: '2024-04-18')

marc = User.create(
		name: "Marc Majcher",
        email: "Lord_of_games@flatiron.com"
	)

aaron = User.create(
    name: "Aaron Hellam",
    email: "CoolGuyStoryBro@story.com"
)

campground_1 = Campground.create(
        camp_name: "FlatIron Campgrounds",
        is_full: false
    )

camp1 = Campsite.create(
    site_number: Faker::Number.number(digits: 2),
    has_picnic_table: [true, false].sample,
    has_firepit: [true, false].sample,
    has_bathrooms: [true, false].sample,
    has_rv_hookup: [true, false].sample,
    daily_price: Faker::Number.number(digits: 2),
    campground_id: campground_1.id
)

camp2 = Campsite.create(
    site_number: Faker::Number.number(digits: 2),
    has_picnic_table: [true, false].sample,
    has_firepit: [true, false].sample,
    has_bathrooms: [true, false].sample,
    has_rv_hookup: [true, false].sample,
    daily_price: Faker::Number.number(digits: 2),
    campground_id: campground_1.id
)

marcs_reservation = Reservation.create(
        user_id: marc.id,
        campsite_id: camp1.id,
        start_date: start_date.strftime('%Y-%m-%d %H:%M'),
        end_date: end_date.strftime('%Y-%m-%d %H:%M'),
        price_total: Faker::Number.number(digits: 2),
    )

aarons_reservation = Reservation.create(
    user_id: aaron.id,
    campsite_id: camp1.id,
    start_date: start_date.strftime('%Y-%m-%d %H:%M'),
    end_date: end_date.strftime('%Y-%m-%d %H:%M'),
    price_total: Faker::Number.number(digits: 2),
)


puts "✅ Done seeding!"

binding.pry


# puts "🌱 Seeding camps..."

# puts "Creating fake users"
# users = []
# 10.times do
# 	users << User.create(
# 		name: Faker::Name.name,
#         email: Faker::Internet.email
# 	)
# end

# puts "Creating fake Camgrounds"
# campgrounds = []
# 10.times do
#     campgrounds << Campground.create(
#         camp_name: "#{Faker::Mountain.name} campgrounds",
#         is_full: [true, false].sample
#         )
#     end
    
# puts "Creating fake Reservations"
# reservations = []
# 10.times do
#     start_date = Faker::Date.between(from: '2022-04-18', to: '2023-04-18')
#     end_date = Faker::Date.between(from: start_date.strftime('%Y-%m-%d'), to: '2024-04-18')
# 	reservations << Reservation.create(
#         user_id: users.sample.id,
#         start_date: start_date.strftime('%Y-%m-%d %H:%M'),
#         end_date: end_date.strftime('%Y-%m-%d %H:%M'),
#         price_total: Faker::Number.number(digits: 2)
# 	)
# end

    
# puts "Creating fake Campsites"
# 10.times do
#     Campsite.create(
#         site_number: Faker::Number.number(digits: 2),
#         has_picnic_table: [true, false].sample,
#         has_firepit: [true, false].sample,
#         has_bathrooms: [true, false].sample,
#         has_rv_hookup: [true, false].sample,
#         daily_price: Faker::Number.number(digits: 2),
#         campground_id: campgrounds.sample.id,
#         reservation_id: reservations.sample.id
#     )
# end