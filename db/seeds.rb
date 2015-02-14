# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'securerandom'

password = SecureRandom.base64(26)
AdminUser.create!(email: 'leanblog@example.com', password: password)

path =  File.join(Rails.root, 'tmp', 'default_admin_password')

begin
  File.write(path, password)
rescue IOError => ex
  puts "[ERROR] Write password to disk failed. Please ensure you have permission to write to '#{path}'."
end