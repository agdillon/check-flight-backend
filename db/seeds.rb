# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Airport.create(code: 'ALS', lat: 37.4444, long: -105.865, name: 'San Luis Valley Regional Airport', city: 'Alamosa', state: 'Colorado')
Airport.create(code: 'APA', lat: 39.5752, long: -104.845, name: 'Centennial Airport', city: 'Englewood', state: 'Colorado')
Airport.create(code: 'ASE', lat: 39.2197, long: -106.864, name: 'Aspen Pitkin County Airport-Sardy Field', city: 'Aspen', state: 'Colorado')
Airport.create(code: 'CEZ', lat: 37.3044, long: -108.63, name: 'Cortez-Montezuma County Airport', city: 'Cortez', state: 'Colorado')
Airport.create(code: 'COS', lat: 38.7829, long: -104.697, name: 'City of Colorado Springs Municipal Airport', city: 'Colorado Springs', state: 'Colorado')
Airport.create(code: 'DEN', lat: 39.8396, long: -104.672, name: 'Denver International Airport', city: 'Denver', state: 'Colorado')
Airport.create(code: 'DRO', lat: 37.1595, long: -107.751, name: 'Durango la Plata County Airport', city: 'Durango', state: 'Colorado')
Airport.create(code: 'EGE', lat: 39.6395, long: -106.912, name: 'Eagle County Regional Airport', city: 'Gypsum', state: 'Colorado')
Airport.create(code: 'FNL', lat: 40.4505, long: -105.008, name: 'Fort Collins Loveland Municipal Airport', city: 'Loveland', state: 'Colorado')
Airport.create(code: 'GJT', lat: 39.1217, long: -108.529, name: 'Walker Field Airport', city: 'Grand Junction', state: 'Colorado')
Airport.create(code: 'GUC', lat: 38.5356, long: -106.941, name: 'Gunnison County Airport', city: 'Gunnison', state: 'Colorado')
Airport.create(code: 'HDN', lat: 40.485, long: -107.219, name: 'Yampa Valley Airport', city: 'Hayden', state: 'Colorado')
Airport.create(code: 'MTJ', lat: 38.5003, long: -107.899, name: 'Montrose Regional Airport', city: 'Montrose', state: 'Colorado')
Airport.create(code: 'PUB', lat: 38.2836, long: -104.496, name: 'Pueblo Memorial Airport', city: 'Pueblo', state: 'Colorado')
Airport.create(code: 'TEX', lat: 37.9544, long: -107.901, name: 'Telluride Regional Airport', city: 'Telluride', state: 'Colorado')

50.times do
  User.create(
    firstName: Faker::Name.first_name,
    lastName: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    isExaminer: [true, false].sample,
    bio: Faker::Lorem.paragraph(3, true),
    rates: rand(100..900)
  )
end

for i in 1..50 do
  @user = User.find(i)
  if @user.isExaminer == true
    for j in 0..2 do
      AirportUser.create(
        user_id: @user.id,
        airport_id: rand(1..15)
      )
    end
  end
end
