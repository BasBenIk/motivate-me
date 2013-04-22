# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :username => ENV['ADMIN_USERNAME'].dup,  :date_of_birth => Date.new(1990,1,1), :gender => "male"
puts 'user: ' << user.username
user2 = User.find_or_create_by_email :first_name => "Normal", :last_name => "User", :email => "normal@example.com", :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :username => "Normaaltje", :date_of_birth => Date.new(1990,1,1), :gender => "female"
puts 'user: ' << user2.username
user3 = User.find_or_create_by_email :first_name => "Jan", :last_name => "Reiger", :email => "jan@example.com", :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :username => "Reigermans", :date_of_birth => Date.new(1990,1,1), :gender => "male"
puts 'user: ' << user3.username