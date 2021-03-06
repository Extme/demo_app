namespace :db do
  desc "Fill database with samle data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example user",
                       email:    "example@example.com",
                       password: "example",
                       password_confirmation: "example",
                       admin: true)
  59.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@example.com"
    password = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  20.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..19]
  followers  = users[3..10]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end 
