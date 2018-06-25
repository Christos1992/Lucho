# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "making medications"
number = 1
10.times do
Medication.create!(name: "test#{number}", description: "this drug is very strong")
number = number +1
end
puts "creating a parent"
Parent.create!(first_name: "Christos", last_name: "Angel", gender:"male", date_of_birth: "28/03/1992", working_status: "employed", civil_status:"marrined", hobbies: "football and wine", share_info: true, user_id: 1)
puts "creating a child"
Child.create!(first_name: "Jonas", last_name: "Montan", gender: "boy", date_of_birth: "22/03/1983", type_of_cancer: "Leukemia", stage_of_cancer: 1, first_time_patient: true, date_treatment_begin: "11/11/2017", hospital_name: "saint george", doctor_name: "Dr.Love", school: true, biggest_dream: "go to the moon", parent_id: 1)
