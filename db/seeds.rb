User.create! name: "Minh Quang",
             email: "quanghoang4334@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now

99.times do |n|
  name = Faker::Games::LeagueOfLegends.champion
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now
end
