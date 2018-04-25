# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# require 'faker'

# # ------------------------- SEEDS FOR DEV ENV -------------------------

# # puts "Starting seed for DEV ENV"

# # Booking.destroy_all
# # Timeslot.destroy_all
# # Activity.destroy_all
# # Client.destroy_all
# # User.destroy_all
# # puts "DB cleaned"

# # USERS

# puts "Creating users seeds"
# test = User.create!(
#   company_name: "Company",
#   SIRET: "12345678901234",
#   first_name: "First",
#   last_name: "Last",
#   phone_number: "+33 6 11 22 33 44",
#   email: "user@example.com",
#   password: "password",
#   website: "www.website.com"
#   )
# puts "done user test"

# 9.times do |i|
#   user = User.create!(
#     company_name: Faker::Company.name,
#     SIRET: Faker::Company.french_siret_number,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone_number: Faker::PhoneNumber.subscriber_number(10),
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(8),
#     website: "www.#{Faker::Internet.domain_word}.com"
#     )
#   puts "done user seed #{i + 1}"
# end


# # ACTIVITIES

# puts "Creating activities seeds on test user"
# 10.times do |i|
#   activity = Activity.new(
#     title: Faker::Dessert.variety,
#     description: Faker::Lorem.sentence,
#     capacity: (100..105).to_a.sample.to_i,
#     duration_in_minutes: [30, 60, 120, 180, 240].sample.to_i,
#     meeting_point: Faker::Address.street_address,
#     status: (0..1).to_a.sample.to_i,
#     adult_price: (10..20).to_a.sample.to_i,
#     child_price:(0..10).to_a.sample.to_i,
#     user: test
#     )
#     # activity.remote_image_url = Faker::LoremPixel.image("50x60", false, 'sports')
#     activity.remote_image_url = "http://estacionautica.com/wp-content/uploads/2016/07/caiac.jpg"
#     activity.save!
#   puts "done activity seed #{i + 1}"

# # TIMESLOTS

#  puts "Creating timeslots seeds"
#   5.times do |j|
#     start_datetime = Faker::Time.forward(15, :day)
#     timeslot = Timeslot.create!(
#       start_datetime:start_datetime,
#       end_datetime: start_datetime + activity.duration_in_minutes * 60,
#       activity: activity,
#       status: (0..1).to_a.sample.to_i
#       )
#     puts "done timeslot seed #{j + 1}"

# # CLIENTS

#     puts "Creating clients seeds"
#     5.times do |k|
#       client = Client.create!(
#           first_name: Faker::Name.first_name,
#           last_name: Faker::Name.last_name,
#           phone_number: Faker::PhoneNumber.phone_number,
#           email: Faker::Internet.email,
#         )
#         puts "done clients seeds #{k + 1}"

# # BOOKINGS

#      puts "Creating booking seeds"
#       5.times do |l|
#         booking = Booking.create!(
#           client: client,
#           timeslot: timeslot,
#           adults: (1..2).to_a.sample.to_i,
#           children: (0..3).to_a.sample.to_i,
#           comments: Faker::Lorem.sentence,
#           total_price: (20..80).to_a.sample.to_i,
#           channel_source: (0..5).to_a.sample.to_i,
#           status: (0..1).to_a.sample.to_i
#           )
#       puts "done bookings seeds #{l + 1}"
#       end
#     end
#   end
# end

# puts "#{User.count} users seeded"
# puts "First user id: #{User.first.id}"
# puts "#{Activity.count} activities seeded"
# puts "First activity id: #{Activity.first.id}"
# puts "#{Timeslot.count} timeslots seeded"
# puts "First timeslot id: #{Timeslot.first.id}"
# puts "#{Booking.count} bookings seeded"
# puts "First booking id: #{Booking.first.id}"
# puts "#{Client.count} clients seeded"
# puts "First client id: #{Client.first.id}"












# ------------------------- SEEDS FOR DEMO DAY -------------------------

puts "Starting seed for DEMO DAY"

Booking.destroy_all
Timeslot.destroy_all
Activity.destroy_all
Client.destroy_all
User.destroy_all # deleted for prod
puts "DB cleaned - appart from users"

# # USERS # Commented because users not deleted anymore

 # test = User.first
 # math = User.last

puts "Creating admin-users seeds"
cece = User.create!(
  id: 1,
  company_name: "Gégé",
  SIRET: "12345678901234",
  first_name: "Céline",
  last_name: "Pernod",
  phone_number: "+33 7 68 01 42 17",
  email: "celine@gege.io",
  password: "lewagon",
  admin: true,
  test: true
  )

sam = User.create!(
  id: 2,
  company_name: "Gégé",
  SIRET: "12345678901234",
  first_name: "Samuel",
  last_name: "Olichon",
  phone_number: "+33 7 69 10 10 94",
  email: "samuel@gege.io",
  password: "lewagon",
  admin: true,
  test: true
  )
puts "done admin-user"

math = User.create!(
  id: 3,
  company_name: "Math Kite Marseille",
  SIRET: "12345678901245",
  first_name: "Math",
  last_name: "Bonpere",
  phone_number: "+33 6 16 74 18 21",
  email: "hello@gege.io",
  password: "password",
  website: "www.math-kite-marseille.com",
  admin: false,
  test: true
  )
puts "done user math"


# ACTIVITIES

puts "Creating activities seeds on math user"
initiation = Activity.create!(
  title: "Initiation",
  description: "Découvrez les plaisirs de la glisse en Kite à Marseille",
  capacity: 4,
  duration_in_minutes: 180,
  meeting_point: "Port de la Pointe Rouge",
  status: 0,
  adult_price: 90,
  child_price: 70,
  user_id: 3,
  image: File.new(File.join(__dir__, "../app/assets/images/initiation.jpg"))
  )


puts "Creating activities seeds on math user2"
perfectionnement = Activity.create!(
  title: "Perfectionnement",
  description: "Envie faire un bon dans votre technique ? Ce cours est fait pour vous !",
  capacity: 2,
  duration_in_minutes: 60,
  meeting_point: "Port de la Pointe Rouge",
  status: 0,
  adult_price: 90,
  child_price: 70,
  user_id: 3,
  image: File.new(File.join(__dir__, "../app/assets/images/perfectionnement.jpg"))
  )

cours_particuliers = Activity.create!(
  title: "Cours Particuliers",
  description: "Développez votre style sur notre magnifique spot marseillais.",
  capacity: 1,
  duration_in_minutes: 60,
  meeting_point: "Port de la Pointe Rouge",
  status: 0,
  adult_price: 120,
  child_price: 100,
  user_id: 3,
  image: File.new(File.join(__dir__, "../app/assets/images/cours_particuliers.jpg"))
  )

puts "done activity seeds"

# TIMESLOTS

#--------------------------

puts "Creating timeslots seeds for initiation"
  10.times do |j|
    start_datetime = Time.new(2018, 02, 26, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      puts "Creating clients seeds"
      2.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 14 38 19 30",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = (0..1).to_a.sample.to_i
          children = (0..1).to_a.sample.to_i
          if (adults + children) == 0
            adults = 1
          end
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Hobbit.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 02, 27, 10, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      2.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{13 * (k+1)} #{24 * (k+1)} #{33 * (k+1)} #{19 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = (0..1).to_a.sample.to_i
          children = (0..1).to_a.sample.to_i
          if (adults + children) == 0
            adults = 1
          end
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Friends.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 02, 28, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      2.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{22 * (k+1)} #{49 * (k+1)} #{14 * (k+1)} #{32 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = (0..1).to_a.sample.to_i
          children = (0..1).to_a.sample.to_i
          if (adults + children) == 0
            adults = 1
          end
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HarryPotter.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 01, 10, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      2.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{18 * (k+1)} #{41 * (k+1)} #{49 * (k+1)} #{37 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = (0..1).to_a.sample.to_i
          children = (0..1).to_a.sample.to_i
          if (adults + children) == 0
            adults = 1
          end
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HowIMetYourMother.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 02, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      2.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{48 * (k+1)} #{29 * (k+1)} #{11 * (k+1)} #{28 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = (0..1).to_a.sample.to_i
          children = (0..1).to_a.sample.to_i
          if (adults + children) == 0
            adults = 1
          end
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Movie.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 03, 10, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + initiation.duration_in_minutes * 60,
      activity: initiation,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 49 37 41 28",
            email: Faker::Internet.email,
          )
          puts "done clients seeds 1"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Simpsons.quote,
              total_price: total_price,
              channel_source: 3,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds 1"
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 27 44 19 20",
            email: Faker::Internet.email,
          )
          puts "done clients seeds 2"
        puts "Creating booking seeds"
          adults = 0
          children = 1
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Simpsons.quote,
              total_price: total_price,
              channel_source: 2,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds 2"
  end

#--------------------------

puts "Creating timeslots seeds for perfectionnement.title"
  10.times do |j|
    start_datetime = Time.new(2018, 02, 27, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + perfectionnement.duration_in_minutes * 60,
      activity: perfectionnement,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..2).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{19 * (k+1)} #{28 * (k+1)} #{41 * (k+1)} #{27 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Hobbit.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 02, 28, 10, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + perfectionnement.duration_in_minutes * 60,
      activity: perfectionnement,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..2).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{11 * (k+1)} #{26 * (k+1)} #{42 * (k+1)} #{39 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Friends.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 01, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + perfectionnement.duration_in_minutes * 60,
      activity: perfectionnement,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..2).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{11 * (k+1)} #{28 * (k+1)} #{31 * (k+1)} #{47 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HarryPotter.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 02, 10, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + perfectionnement.duration_in_minutes * 60,
      activity: perfectionnement,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..2).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{41 * (k+1)} #{27 * (k+1)} #{45 * (k+1)} #{15 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HowIMetYourMother.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 03, 14, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + perfectionnement.duration_in_minutes * 60,
      activity: perfectionnement,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..2).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{15 * (k+1)} #{41 * (k+1)} #{28 * (k+1)} #{39 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Movie.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

#--------------------------

puts "Creating timeslots seeds for cours_particuliers"
  10.times do |j|
    start_datetime = Time.new(2018, 02, 27, 16, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + cours_particuliers.duration_in_minutes * 60,
      activity: cours_particuliers,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..1).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 13 08 41 23",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Simpsons.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 02, 28, 12, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + cours_particuliers.duration_in_minutes * 60,
      activity: cours_particuliers,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..1).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{16 * (k+1)} #{02 * (k+1)} #{19 * (k+1)} #{20 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Hobbit.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 01, 16, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + cours_particuliers.duration_in_minutes * 60,
      activity: cours_particuliers,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..1).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{14 * (k+1)} #{35 * (k+1)} #{39 * (k+1)} #{03 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::Friends.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 02, 12, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + cours_particuliers.duration_in_minutes * 60,
      activity: cours_particuliers,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..1).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 #{45 * (k+1)} #{01 * (k+1)} #{39 * (k+1)} #{36 * (k+1)}",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HarryPotter.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

  10.times do |j|
    start_datetime = Time.new(2018, 03, 03, 16, 00) + j * 7 * 24 * 60 * 60
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + cours_particuliers.duration_in_minutes * 60,
      activity: cours_particuliers,
      status: "empty"
      )
    puts "done timeslot seed #{timeslot.activity.title} #{j + 1}"
      (0..1).to_a.sample.to_i.times do |k|
        client = Client.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            phone_number: "06 39 58 37 02",
            email: Faker::Internet.email,
          )
          puts "done clients seeds #{k + 1}"
        puts "Creating booking seeds"
          adults = 1
          children = 0
          adults_price = adults * cours_particuliers.adult_price
          children_price = children * cours_particuliers.child_price
          total_price = adults_price + children_price
          1.times do |l|
            booking = Booking.create!(
              client: client,
              timeslot: timeslot,
              adults: adults,
              children: children,
              comments: Faker::HowIMetYourMother.quote,
              total_price: total_price,
              channel_source: (0..5).to_a.sample.to_i,
              status: (0..2).to_a.sample.to_i
              )
          puts "done bookings seeds #{l + 1}"
          end
      end
  end

# SEED CLIENT MORGAN

morgan = Client.create!(
  first_name: "Morgan",
  last_name: "Di Via",
  phone_number: "06 33 92 60 98",
  email: "morgan.divia@lewagon.org",
  )
start_datetime = Time.new(2018, 02, 26, 10, 00)
timeslot_init = Timeslot.create!(
  start_datetime:start_datetime,
  end_datetime: start_datetime + initiation.duration_in_minutes * 60,
  activity: initiation,
  status: "empty"
  )
booking = Booking.create!(
  client: morgan,
  timeslot: timeslot_init,
  adults: 1,
  children: 0,
  comments: "Au top !",
  total_price: 90,
  channel_source: (0..5).to_a.sample.to_i,
  status: (0..2).to_a.sample.to_i
  )
timeslot_perf = Timeslot.create!(
  start_datetime:start_datetime,
  end_datetime: start_datetime + initiation.duration_in_minutes * 60,
  activity: perfectionnement,
  status: "empty"
  )
booking = Booking.create!(
  client: morgan,
  timeslot: timeslot_perf,
  adults: 1,
  children: 0,
  comments: "Au top !",
  total_price: 90,
  channel_source: (0..5).to_a.sample.to_i,
  status: (0..2).to_a.sample.to_i
  )
timeslot_cp = Timeslot.create!(
  start_datetime:start_datetime,
  end_datetime: start_datetime + initiation.duration_in_minutes * 60,
  activity: cours_particuliers,
  status: "empty"
  )
booking = Booking.create!(
  client: morgan,
  timeslot: timeslot_cp,
  adults: 1,
  children: 0,
  comments: "Au top !",
  total_price: 120,
  channel_source: (0..5).to_a.sample.to_i,
  status: (0..2).to_a.sample.to_i
  )

puts "#{User.count} users seeded"
puts "First user id: #{User.first.id}"
puts "#{Activity.count} activities seeded"
puts "First activity id: #{Activity.first.id}"
puts "#{Timeslot.count} timeslots seeded"
puts "First timeslot id: #{Timeslot.first.id}"
puts "#{Booking.count} bookings seeded"
puts "First booking id: #{Booking.first.id}"
puts "#{Client.count} clients seeded"
puts "First client id: #{Client.first.id}"
