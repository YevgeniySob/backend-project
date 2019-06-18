# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create(username: 'yev', password: '123', first_name: 'Yevgeniy', last_name: 'Sobolev')

count = 1
5.times do
  count += 10
  User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123', email: Faker::Internet.email, image: "https://picsum.photos/id/#{count}/200/200")
end

count = 1
5.times do
  UserGeolocation.create(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, user_id: count)
  count += 1
end

abbr = [ 'AK',
           'AL',
           'AR',
           'AS',
           'AZ',
           'CA',
           'CO',
           'CT',
           'DC',
           'DE',
           'FL',
           'GA',
           'GU',
           'HI',
           'IA',
           'ID',
           'IL',
           'IN',
           'KS',
           'KY',
           'LA',
           'MA',
           'MD',
           'ME',
           'MI',
           'MN',
           'MO',
           'MS',
           'MT',
           'NC',
           'ND',
           'NE',
           'NH',
           'NJ',
           'NM',
           'NV',
           'NY',
           'OH',
           'OK',
           'OR',
           'PA',
           'PR',
           'RI',
           'SC',
           'SD',
           'TN',
           'TX',
           'UT',
           'VA',
           'VI',
           'VT',
           'WA',
           'WI',
           'WV',
           'WY']
states = ['Alaska',
          'Alabama',
          'Arkansas',
          'American Samoa',
          'Arizona',
          'California',
          'Colorado',
          'Connecticut',
          'District of Columbia',
          'Delaware',
          'Florida',
          'Georgia',
          'Guam',
          'Hawaii',
          'Iowa',
          'Idaho',
          'Illinois',
          'Indiana',
          'Kansas',
          'Kentucky',
          'Louisiana',
          'Massachusetts',
          'Maryland',
          'Maine',
          'Michigan',
          'Minnesota',
          'Missouri',
          'Mississippi',
          'Montana',
          'North Carolina',
          'North Dakota',
          'Nebraska',
          'New Hampshire',
          'New Jersey',
          'New Mexico',
          'Nevada',
          'New York',
          'Ohio',
          'Oklahoma',
          'Oregon',
          'Pennsylvania',
          'Puerto Rico',
          'Rhode Island',
          'South Carolina',
          'South Dakota',
          'Tennessee',
          'Texas',
          'Utah',
          'Virginia',
          'Virgin Islands',
          'Vermont',
          'Washington',
          'Wisconsin',
          'West Virginia',
          'Wyoming']

abbr.each_with_index do |abr, idx|
  State.create(name: states[idx], abbreviation: abr)
end

picnum = 13
10.times do
  Report.create(title: Faker::Lorem.sentence(2), description: Faker::Lorem.paragraph, votes: 0, image: "https://picsum.photos/id/#{picnum}/500/300", date: Faker::Date.between(2.days.ago, Date.today), time: Faker::Time.between(2.days.ago, Date.today, :afternoon), state_id: 37, user_id: User.all.sample.id)
  picnum += rand(1...10)
end

10.times do
  Report.create(title: Faker::Lorem.sentence(2), description: Faker::Lorem.paragraph, votes: 0, image: "https://picsum.photos/id/#{picnum}/500/300", date: Faker::Date.between(2.days.ago, Date.today), time: Faker::Time.between(2.days.ago, Date.today, :afternoon), state_id: 6, user_id: User.all.sample.id)
  picnum += rand(1...10)
end

count = 1
Report.all.length.times do
  Address.create(city: Faker::Address.city, street: Faker::Address.street_address, zipcode: Faker::Address.zip_code, report_id: count)
  count += 1
end

count = 1
Report.all.length.times do
  ReportGeolocation.create(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, report_id: count)
  count += 1
end

count = 1
Report.all.length.times do
  rand(5...20).times do
    Comment.create(content: Faker::Lorem.sentence(10), points: 0, user_id: User.all.sample.id, report_id: count)
  end
  count += 1
end
