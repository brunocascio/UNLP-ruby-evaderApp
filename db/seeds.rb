# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def generate_cuilt(dni)
  cuilt = Faker::Number.number(2).to_s
  cuilt << '-'
  cuilt << dni
  cuilt << '-'
  cuilt << Faker::Number.number(1).to_s
end

#
# Create contact types
#
contacts_types = Contact.create([{name: 'teléfono'}, {name: 'email'}])
contact_type_phone = contacts_types[0]
contact_type_email = contacts_types[1]

#
# Create clients
#
10.times do
  fullname = Faker::Name.name.split(' ')
  identification_number = Faker::Number.number(8).to_s
  cuilt = generate_cuilt(identification_number)
  Client.create(
    firstname: fullname.first.truncate(29),
    lastname: fullname.last.truncate(29),
    cuilt: cuilt,
    birthdate: Faker::Date.between(50.year.ago, 18.year.ago),
    genre: rand(2) == 0 ? 'male' : 'female',
    identification_number: identification_number
  )
end


#
# Assign contact info to clients
#
Client.all.each do |client|
  client.clients_contacts.build(contact: contact_type_email, value: Faker::Internet.free_email).save
  client.clients_contacts.build(contact: contact_type_phone, value: Faker::PhoneNumber.cell_phone).save
end

#
# Create people
#
20.times do
  Person.create(
    name: (Faker::Name.name).truncate(29),
    person_type: 'fisic',
    cuilt: generate_cuilt(Faker::Number.number(8).to_s)
  )
end

#
# Create Invoices
#
100.times do
  Invoice.create(
    description: Faker::Lorem.sentence,
    amount: Faker::Number.decimal(4),
    issue_date: Faker::Date.between(2.year.ago, Date.today),
    client_id: Client.order('RANDOM()').limit(1).select("id").pluck("id").first,
    person_id: Person.order('RANDOM()').limit(1).select("id").pluck("id").first
  )
end
