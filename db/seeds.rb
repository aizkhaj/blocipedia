require 'random_data'

# Create users
5.times do
  User.create!(
  email: RandomData.email,
  password: RandomData.password
  )
end
users = User.all
# users.confirm - this doesn't seem to work here. #confirm not recognized

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

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} public wikis created"
