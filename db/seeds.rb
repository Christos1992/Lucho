  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "creating a User"
us = User.create!(email: "user@user.com", password: "123456")
puts "making medications"
number = 1
10.times do
Medication.create!(name: "test#{number}", description: "this drug is very strong")
number = number +1
end
puts "creating a parent"
par = Parent.create!(first_name: "Christos", last_name: "Angel", gender:"male", date_of_birth: "28/03/1992", working_status: "employed", civil_status:"marrined", hobbies: "football and wine", share_info: true, user_id: us.id)
puts "creating a child"
chi = Child.create!(first_name: "Jonas", last_name: "Montan", gender: "boy", date_of_birth: "22/03/1983", type_of_cancer: "Leukemia", stage_of_cancer: 1, first_time_patient: true, date_treatment_begin: "11/11/2017", hospital_name: "saint george", doctor_name: "Dr.Love", school: true, biggest_dream: "go to the moon", parent_id: par.id)
puts "creating childmedication"
ChildMedication.create!(perscriptioned_doses: 1, medication_id: Medication.all.sample.id, child_id: chi.id)
puts "making side effects"
#External Radiation Side Effects
SideEffect.create!(name: "Fatigue", metric: "Mild - Normal activity with effort")
SideEffect.create!(name: "Fatigue", metric: "Modarate - In bed less than half of day")
SideEffect.create!(name: "Fatigue", metric:"Severe - In bed more than hald of the day")
SideEffect.create!(name: "Skin Irritation ", metric:" Mild - Faint redness and scaling")
SideEffect.create!(name: "Skin Irritation ", metric:"Moderate - Redness or moist peeling especially at skin folds")
SideEffect.create!(name: "Skin Irritation ", metric: " Severe -Swelling and moist peeling in large area or ulcer in skin")
SideEffect.create!(name: "Nausea", metric: "Mild -Can eat")
SideEffect.create!(name: "Nausea", metric: "Moderate - Eating/drinking less than normal")
SideEffect.create!(name: "Nausea", metric: "Severe - Cant eat or drink")
SideEffect.create!(name: "Fever, Chills", metric: "Mild - Fever 37°C to 38°C")
SideEffect.create!(name: "Fever, Chills", metric: "moderate - Fever 38°C-40°C")
SideEffect.create!(name: "Fever, Chills", metric: "Severe -Fever greater than 40°C")
SideEffect.create!(name: "Vomiting", metric: "Mild - Vomited once during the day")
SideEffect.create!(name: "Vomiting", metric: "Modarate - Vomited 2 to 5 times during the day")
SideEffect.create!(name: "Vomiting", metric: "Severe - Vomited 6 or more times during the
day")
SideEffect.create!(name: "Sore Mouth", metric: "Mild-Soreness or painless ulcer*")
SideEffect.create!(name: "Sore Mouth", metric: "Moderate–Soreness of painful ulcer but can
eat")
SideEffect.create!(name: "Sore Mouth", metric: "Severe-Painful ulcer and cannot eat")
SideEffect.create!(name: "Constipation", metric: "Mild - No bowel movement for 2 days")
SideEffect.create!(name: "Constipation", metric: "Moderate - No bowel movement for 3 to 4 days")
SideEffect.create!(name: "Constipation", metric: "Severe - No bowel movement for more than 4
days or swollen abdomen")
SideEffect.create!(name: "Loss of Appetite (Anorexia)", metric: "Mild – Slightly decreased appetite")
SideEffect.create!(name: "Loss of Appetite (Anorexia)", metric: "Moderate – Usually not hungry")
SideEffect.create!(name: "Loss of Appetite (Anorexia)", metric: "Severe – Nothing looks good/unable to eat")
SideEffect.create!(name: "Pain or difficulty with swallowing", metric: "Mild - Pain but can eat")
SideEffect.create!(name: "Pain or difficulty with swallowing", metric: "Moderate - Pain requiring soft or liquid diet")
SideEffect.create!(name: "Pain or difficulty with swallowing", metric: "Severe - Unable to eat at all")
SideEffect.create!(name: "Swelling (Edema) in Hands or Feet", metric: "Mild – Swelling in hands or feet")
SideEffect.create!(name: "Swelling (Edema) in Hands or Feet", metric: "Moderate – Swelling extending up arm or leg")
SideEffect.create!(name: "Swelling (Edema) in Hands or Feet", metric: "Severe – Swelling with pain or trouble
breathing")

puts "creating incidents for user 1 parent 1"

Incident.create!(medication_name:"BACTRIM",dose:"2ml" ,period: "2 days", description: "easy to take didnt had problem swallowing it", date_medication_received: DateTime.strptime("07/07/2018 8:00", "%m/%d/%Y %H:%M"), date_of_incident:DateTime.strptime("07/05/2018 8:00", "%m/%d/%Y %H:%M"),parent_id: 1)
Incident.create!(medication_name:"BACTRIM",dose:"2ml" ,period: "2 days", description: "easy to take didnt had problem swallowing it", date_medication_received: DateTime.strptime("07/07/2018 8:00", "%m/%d/%Y %H:%M"), date_of_incident:DateTime.strptime("07/03/2018 8:00", "%m/%d/%Y %H:%M"),parent_id: 1)
Incident.create!(medication_name:"CARBOPLATIN",dose:"2ml" ,period: "2 days", description: "easy to take didnt had problem swallowing it", date_medication_received: DateTime.strptime("07/07/2018 8:00", "%m/%d/%Y %H:%M"), date_of_incident:DateTime.strptime("07/01/2018 8:00", "%m/%d/%Y %H:%M"),parent_id: 1)
Incident.create!(medication_name:"CARBOPLATIN",dose:"2ml" ,period: "2 days", description: "easy to take didnt had problem swallowing it", date_medication_received: DateTime.strptime("07/07/2018 8:00", "%m/%d/%Y %H:%M"), date_of_incident:DateTime.strptime("07/01/2018 8:00", "%m/%d/%Y %H:%M"),parent_id: 1)



SideEffectIncident.create!(id: 4, side_effect_id: 7, incident_id: 1,)
SideEffectIncident.create!(id: 3, side_effect_id: 7, incident_id: 1,)
SideEffectIncident.create!(id: 1, side_effect_id: 7, incident_id: 2,)
SideEffectIncident.create!(id: 2, side_effect_id: 9, incident_id: 2,)
SideEffectIncident.create!(id: 5, side_effect_id: 4, incident_id: 3,)
SideEffectIncident.create!(id: 6, side_effect_id: 5, incident_id: 4,)





