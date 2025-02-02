require 'pry'
# This will delete any existing rows from the Restaurant and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Camping data..."
Campground.destroy_all
Campsite.destroy_all
Reservation.destroy_all
User.destroy_all


# puts "✅ Done seeding!"

# # binding.pry


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
#         campsite_id: campsites.sample.id
# 	)
# end

# ***************** User story *********************
# Create a user that user has a reservation for a campground to a specific campsite
puts "Creating User data for a two users (Marc and Aaron) who has one reservation for the same campsite"
# start_date = Faker::Date.between(from: '2022-04-18', to: '2023-04-18')
# end_date = Faker::Date.between(from: start_date.strftime('%Y-%m-%d'), to: '2024-04-18')
start_date = DateTime.now
end_date = start_date+5


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
    daily_price: 15,
    campground_id: campground_1.id,
    camp_name: "Hack Reactor Campgrounds",
    description: Faker::Lorem.paragraph,
    img_url: "https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    liked:[true, false].sample
)

camp2 = Campsite.create(
    site_number: Faker::Number.number(digits: 2),
    has_picnic_table: [true, false].sample,
    has_firepit: [true, false].sample,
    has_bathrooms: [true, false].sample,
    has_rv_hookup: [true, false].sample,
    daily_price: 25,
    campground_id: campground_1.id,
    camp_name: "FlatIron Campgrounds",
    description: Faker::Lorem.paragraph,
    img_url: "https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2FtcGdyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    liked:[true, false].sample
)

marcs_reservation_1 = Reservation.create(
        user_id: marc.id,
        campsite_id: camp1.id,
        start_date: start_date.strftime('%Y-%m-%d %H:%M'),
        end_date: end_date.strftime('%Y-%m-%d %H:%M'),
        price_total: Faker::Number.number(digits: 2),
        favorite: [true, false].sample
    )

marcs_reservation_2 = Reservation.create(
    user_id: marc.id,
    campsite_id: camp1.id,
    start_date: start_date.strftime('%Y-%m-%d %H:%M'),
    end_date: end_date.strftime('%Y-%m-%d %H:%M'),
    price_total: Faker::Number.number(digits: 2),
    favorite: [true, false].sample
)

aarons_reservation1 = Reservation.create(
    user_id: aaron.id,
    campsite_id: camp1.id,
    start_date: start_date.strftime('%Y-%m-%d %H:%M'),
    end_date: end_date.strftime('%Y-%m-%d %H:%M'),
    price_total: Faker::Number.number(digits: 2),
    favorite: [true, false].sample
)

aarons_reservation2 = Reservation.create(
    user_id: aaron.id,
    campsite_id: camp1.id,
    start_date: start_date.strftime('%Y-%m-%d %H:%M'),
    end_date: end_date.strftime('%Y-%m-%d %H:%M'),
    price_total: Faker::Number.number(digits: 2),
    favorite: [true, false].sample
)


CAMPSITE_URLS = ["https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2FtcGdyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",

"https://images.unsplash.com/photo-1470246973918-29a93221c455?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",

"https://images.unsplash.com/photo-1525811902-f2342640856e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FtcGdyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1534880606858-29b0e8a24e8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcGdyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1476041800959-2f6bb412c8ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtcGdyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1603161472885-39edf23d7a3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FtcHNpdGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1564577160324-112d603f750f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FtcHNpdGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",

"https://images.unsplash.com/photo-1598417136294-7c1c4c94931f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcHNpdGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"]

puts "Creating fake Campsites"
25.times do
    Campsite.create(
        site_number: Faker::Number.number(digits: 2),
        has_picnic_table: [true, false].sample,
        has_firepit: [true, false].sample,
        has_bathrooms: [true, false].sample,
        has_rv_hookup: [true, false].sample,
        daily_price: Faker::Number.number(digits: 2),
        campground_id: campground_1.id,
        camp_name: "#{Faker::Mountain.name} campgrounds",
        description: Faker::Lorem.paragraph,
        img_url: CAMPSITE_URLS.sample,
        liked:[true, false].sample
    )
end