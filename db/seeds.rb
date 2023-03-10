# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all

100.times do |index|
  # City.create(
  #   name:Faker::Address.city, 
  #   zip_code:Faker::Number.number(digits: 5)
  # ) 
  
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    description: Faker::Superhero.name,
    email: "#{["Kachou", "Champion78", "Victime83", "Toto"].sample}@#{["gmail.com", "yahoo.fr" , "lycos.fr", "wanadoo.fr", "laposte.net"].sample}",
    age: rand(5..99),
    city: City.find(rand(City.first.id..City.last.id))
   )

   Gossip.create(
    title: Faker::Movie.title,
    content: Faker::Lorem.sentence,
    user: User.find(rand(User.first.id..User.last.id)) 
  ) 

  Tag.create(
    title: Faker::Vehicle.manufacture
  ) 

  JoinTableGossipTag.create(
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)),
    tag: Tag.find(rand(Tag.first.id..Tag.last.id)) 
  ) 

  PrivateMessage.create(
    content: Faker::Lorem.sentence,
    recipient: User.find(rand(User.first.id..User.last.id)),           
    sender: User.find(rand(User.first.id..User.last.id)) 
  ) 
end

puts "Seeding réalisé avec succès !"
