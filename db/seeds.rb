# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

shelter.pets.create(name: 'Fido', breed: 'Beagle', age: 5, adoptable: true)
shelter_3.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
shelter_2.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)

new_applicant = Applicant.create(name: "Test", address: "5555 Test Avenue", city: "Denver", state: "CO", zip: 55555, names_pets_wanted: "Fido", description: "they love pets!", application_status: "In Progress")
