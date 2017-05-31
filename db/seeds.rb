require 'random_data'

# Create users
5.times do
  user = User.create!(
    email: RandomData.email,
    password: RandomData.password
  )
  user.confirm
end
users = User.all

# Create Public Wiki
50.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: RandomData.sentence,
    body: RandomData.paragraph,
    private: false
  )
end

# Create an admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.confirm

# Create a premium user
premium = User.create!(
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)
premium.confirm

# Create a basic user
basic = User.create!(
  email: 'basic@example.com',
  password: 'helloworld',
  role: 'basic'
)
basic.confirm

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} public wikis created"
