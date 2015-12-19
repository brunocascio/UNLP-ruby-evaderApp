# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contacts_types = Contact.create(
  [
    {
      name: 'phone'
    },
    {
      name: 'email'
    }
  ]
)

#
# Create clients
#
#
clients = Client.create(
  [
    {
      firstname: 'Pepe',
      lastname: 'Perez',
      cuilt: '20-35415987-3',
      birthdate: Time.now - 25.year,
      genre: 'male',
      identification_number: '35415987'
    },
    {
      firstname: 'Maria',
      lastname: 'Gonzales',
      cuilt: '20-32435927-7',
      birthdate: Time.now - 40.year,
      genre: 'female',
      identification_number: '32435927'
    }
  ]
)

#
# Get clients
#
#
client1 = Client.find(1)
client2 = Client.find(2)

#
# Assign contact info
#
#
client1.clients_contacts.build(contact: contacts_types[1], value: 'mail1@mail.com').save
client1.clients_contacts.build(contact: contacts_types[0], value: '2234567789').save
client2.clients_contacts.build(contact: contacts_types[1], value: 'mail2@mail.com').save
client2.clients_contacts.build(contact: contacts_types[0], value: '2214565455').save

#
# Create people
#
#
people = Person.create(
  [
    {
      name: 'Jose Hernandez',
      person_type: 'fisic',
      cuilt: '20-12345678-3'
    },
    {
      name: 'Jorge Rodriguez',
      person_type: 'fisic',
      cuilt: '20-12345679-3'
    },
    {
      name: 'Josefina Perez',
      person_type: 'fisic',
      cuilt: '20-12445670-7'
    },
    {
      name: 'UNLP',
      person_type: 'juridic',
      cuilt: '10-38274658-3'
    }
  ]
)

personJose = people[0]
personJorge = people[1]
personJosefina = people[2]
personUNLP = people[3]

#
# Create Invoices
#
#
invoices = Invoice.create(
  [
    {
      description: "Description invoice for #{personJose.name} in month #{(Time.now - 4.month).month} of client #{client1.id}",
      amount: 1010.00,
      issue_date: Time.now - 4.month,
      client_id: client1.id,
      person_id: personJose.id
    },
    {
      description: "Description invoice for #{personJose.name} in month #{(Time.now - 3.month).month} of client #{client1.id}",
      amount: 1010.00,
      issue_date: Time.now - 3.month,
      client_id: client1.id,
      person_id: personJose.id
    },
    {
      description: "Description invoice for #{personJose.name} in month #{(Time.now - 2.month).month} of client #{client1.id}",
      amount: 1010.00,
      issue_date: Time.now - 2.month,
      client_id: client1.id,
      person_id: personJose.id
    },
    {
      description: "Description invoice for #{personJose.name} in month #{(Time.now - 1.month).month} of client #{client1.id}",
      amount: 1010.00,
      issue_date: Time.now - 1.month,
      client_id: client1.id,
      person_id: personJose.id
    },
    {
      description: "Description invoice for #{personJorge.name} in month #{(Time.now - 4.month).month} of client #{client2.id}",
      amount: 1000.00,
      issue_date: Time.now - 4.month,
      client_id: client2.id,
      person_id: personJorge.id
    },
    {
      description: "Description invoice for #{personUNLP.name} in month #{(Time.now - 3.month).month} of client #{client2.id}",
      amount: 10000.00,
      issue_date: Time.now - 3.month,
      client_id: client2.id,
      person_id: personUNLP.id
    }
  ]
)
