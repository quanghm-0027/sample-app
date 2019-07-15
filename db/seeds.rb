User.create! name: "Minh Quang",
             email: "quanghoang4334@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now
50.times do |n|
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

users = User.order(:created_at).take(6)
30.times do
  content = Faker::Sports::Football.team
  users.each {|user| user.microposts.create!(content: content)}
end

users = User.all
user  = users.first
following = users[2..30]
followers = users[5..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
