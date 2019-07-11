User.create(username: 'test', password: '123', first_name: 'Yevgeniy', last_name: 'Sobolev')

count = 1
5.times do
  count += 10
  User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123', email: Faker::Internet.email, image: "https://picsum.photos/id/#{count}/50/50")
end

count = 1
User.all.length.times do
  UserGeolocation.create(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, user_id: count)
  count += 1
end

abbr = ['AK',
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

count = 1
State.all.length.times do
  picnum = 13
  7.times do
    Report.create(title: Faker::Lorem.sentence(2), description: Faker::Lorem.paragraph, votes: 0, image: "https://picsum.photos/id/#{picnum}/500/300", date: Faker::Date.between(2.days.ago, Date.today), state_id: count, user_id: User.all.sample.id)
    picnum += rand(1...5)
  end
  count += 1
end

count = 1
Report.all.length.times do
  Address.create(city: Faker::Address.city, street: Faker::Address.street_address, zipcode: Faker::Address.zip_code, report_id: count)
  ReportGeolocation.create(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, report_id: count)
  rand(5...20).times do
    Comment.create(content: Faker::Lorem.sentence(10), points: 0, user_id: User.all.sample.id, report_id: count)
  end
  count += 1
end
