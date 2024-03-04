puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
puts "Prepare data base"

require "open-uri"

userAdmin = User.new
userAdmin.full_name = "Axel"
userAdmin.email = 'axelpatton@gmail.com'
userAdmin.password = 'demo123'
userAdmin.role = true # this is admin
userAdmin.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/5597266?s=400&v=4"), filename: "avatar")
userAdmin.save!

userNoAdmin = User.new
userNoAdmin.full_name = "Samuel Oliveira"
userNoAdmin.email = "olsamuel@gmail.com"
userNoAdmin.password = 'demo123' 
userNoAdmin.photo.attach(io: URI.open("https://images.freeimages.com/images/large-previews/cd5/lady-avatar-1632969.jpg?fmt=webp&h=350"), filename: "avatar")
userNoAdmin.save!

(1..15).each do
  user = User.new
  user.full_name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  user.email = "#{user.full_name.downcase.gsub(" ","")}@gmail.com.br"
  user.password = 'demo123'
  user.photo.attach(io: URI.open("https://loremflickr.com/320/240/face"), filename: "avatar")
  user.save!
end
