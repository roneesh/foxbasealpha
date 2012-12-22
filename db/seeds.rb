# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Destroying all users..."
User.destroy_all
puts "Users destroyed!"

puts "Destroying all Alphas..."
Alpha.destroy_all
puts "Alphas destroyed!"

puts "Destroying all Microposts..."
Micropost.destroy_all
puts "Microposts destroyed!"

puts "Destroying all Whitelist entries..."
Whitelist.destroy_all
puts "Whitelist completely erased!"

users = [
	{name: "Roneesh Vashisht", email: "roneesh@gmail.com", handle: "Ronnie", password: "1", password_confirmation: "1"},
	{name: "Password User", email: "password@example.com", handle: "Passy", password: "1", password_confirmation: "1"}
]

puts "Creating users..."
User.create users
puts "Users created!"

#For this creation of alphas to work...
#You must rake db:drop then rake db:migrate then rake db:seed
alphas = [
	{name: "Foxbase 1", admin_id: User.find_by_email("roneesh@gmail.com").id},
	{name: "Foxbase 2", admin_id: User.find_by_email("roneesh@gmail.com").id},
	{name: "Foxbase 3", admin_id: User.find_by_email("password@example.com").id, isprivate: true}
]

puts "Creating Alphas"
Alpha.create alphas
puts "Alphas created"