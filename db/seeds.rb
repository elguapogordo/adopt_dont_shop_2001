# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.create(name: "Buddy Center", address: "4556 Castleton Court", city: "Castle Rock", state: "CO", zip: "80109")
Shelter.create(name: "Leslie A. Malone Center", address: "2080 S. Quebec St.", city: "Denver", state: "CO", zip: "80231")
Pet.create(name: "Bailey", sex: "female", age: 6, description: "dog", image: "https://i.redd.it/hcprm17ktpu21.jpg", shelter_id: 1)
Pet.create(name: "Cooper", sex: "male", age: 4, description: "dog", image: "https://www.tinypetstube.com/wp-content/uploads/funny-derp-dog.jpg", shelter_id: 1)
Pet.create(name: "Sophie", sex: "female", age: 3, description: "cat", image: "https://compote.slate.com/images/5d0784dc-0c12-4a8b-a97b-3e3c856d7186.jpg", shelter_id: 1)
Pet.create(name: "Tigger", sex: "male", age: 5, description: "cat", image: "https://www.catster.com/wp-content/uploads/2015/06/roxy-butt.jpg", shelter_id: 2)
Pet.create(name: "Max", sex: "male", age: 3, description: "dog", image: "https://i.t3hwin.com/2014/11/Derp-dog.jpg", shelter_id: 2)
Pet.create(name: "Charlie", sex: "male", age: 1, description: "cat", image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/10/ugly-kitten-romeo-3.jpg", shelter_id: 2)
