require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test "Try to create an empty client" do
    assert_not Client.new.save(), "Shouldn't create an empty client."
  end

  test "Try to create a client without some property" do
    assert_not Client.new(firstname: 'Pepe').save(), "Shouldn't create a client only with firstname."
    assert_not Client.new(lastname: 'Pepe').save(), "Shouldn't create a client only with lastname."
    assert_not Client.new(cuilt: '20-35232322-3').save(), "Shouldn't create a client only with cuil/cuilt."
    assert_not Client.new(birthdate: Date.parse('1991-6-7')).save(), "Shouldn't create a client only with birthdate."
    assert_not Client.new(genre: 0).save(), "Shouldn't create a client only with genre."
    assert_not Client.new(genre: 1).save(), "Shouldn't create a client only with genre."
    assert_not Client.new(identification_number: '35415987').save(), "Shouldn't create a client only with identification number."
  end

  test "Try to create a client with valid data" do
    @data = {
      firstname: 'Pepe',
      lastname: 'Perez',
      cuilt: '20-35232321-3',
      birthdate: '1991-06-07',
      genre: 'male',
      identification_number: '35232321'
    }
    assert Client.new(@data).save(), "Should create a client with valid data"
  end

  test "Try to associate a client with a contact" do
    c = Client.first
    c.clients_contacts.build(value: 'mail@mail.com', contact: contacts(:email))
    assert c.save, "Should create a client with associated contact data"
    assert c.clients_contacts.last.contact.name == contacts(:email).name
    assert c.clients_contacts.last.value == 'mail@mail.com'
  end

  test "Try to create a client with invalid data" do
    @data = {
      firstname: 'Pepe',
      lastname: 'Perez',
      cuilt: '20-35232322-3',
      birthdate: Date.parse('1991-6-7'),
      genre: 0,
      identification_number: '35415987'
    }

    # Firstname Validations
    @firstnameInvalidClient = @data.clone
    @firstnameInvalidClient[:firstname] = ""
    assert_not Client.new(@firstnameInvalidClient).save(), "Shouldn't create a client with firstname blank"
    @firstnameInvalidClient[:firstname] = '1212'
    assert_not Client.new(@firstnameInvalidClient).save(), "Shouldn't create a client with invalid firstname format (Only letters)"
    @firstnameInvalidClient[:firstname] = 'a'
    assert_not Client.new(@firstnameInvalidClient).save(), "Shouldn't create a client firstname with only 1 letter"

    # Lastname Validations
    @lastnameInvalidClient = @data.clone
    @lastnameInvalidClient[:lastname] = ''
    assert_not Client.new(@lastnameInvalidClient).save(), "Shouldn't create a client with lastname blank"
    @lastnameInvalidClient[:lastname] = '1212'
    assert_not Client.new(@lastnameInvalidClient).save(), "Shouldn't create a client with invalid lastname format (Only letters)"
    @lastnameInvalidClient[:lastname] = 'a'
    assert_not Client.new(@lastnameInvalidClient).save(), "Shouldn't create a client lastname with only 1 letter"

    # Genre Validations
    # TODO: rails ArgumentError ?
    # @genreInvalidClient = @data.clone
    # @genreInvalidClient[:genre] = ''
    # assert_not Client.new(@genreInvalidClient).save(), "Shouldn't create a client with blank genre"
    # @genreInvalidClient[:genre] = '...'
    # assert_not Client.new(@genreInvalidClient).save(), "Shouldn't create a client with invalid genre (passing invalid int)"
    # @genreInvalidClient[:genre] = 'catinga'
    # assert_not Client.new(@genreInvalidClient).save(), "Shouldn't create a client with invalid genre (passing invalid symbol)"

    # Birthdate Validations
    @birthdateInvalidClient = @data.clone
    @birthdateInvalidClient[:birthdate] = '616161'
    assert_not Client.new(@birthdateInvalidClient).save(), "Shouldn't create a client with invalid birthdate format"

    # identification Number Validations
    @INInvalidClient = @data.clone
    @INInvalidClient[:identification_number] = ''
    assert_not Client.new(@INInvalidClient).save(), "Shouldn't create a client with blank identification number"
    @INInvalidClient[:identification_number] = 'asasas'
    assert_not Client.new(@INInvalidClient).save(), "Shouldn't create a client with invalid identification number format (only numbers)"
    @INInvalidClient[:identification_number] = '1'
    assert_not Client.new(@INInvalidClient).save(), "Shouldn't create a client with invalid identification number (> 5 digits)"
    @INInvalidClient[:identification_number] = '123456789'
    assert_not Client.new(@INInvalidClient).save(), "Shouldn't create a client with invalid identification number (< 9 digits)"
  end

  test "Try to create a client with duplicated cuil/cuit" do
    @data = {
      firstname: 'Jose',
      lastname: 'Fernandez',
      cuilt: '20-25231321-2',
      birthdate: Date.parse('1971-3-1'),
      genre: 0,
      identification_number: '25231321'
    }
    Client.new(@data).save()
    assert_not Client.new(@data).save(), "Shouldn't create a duplicate client with same cuil/cuit."
  end

  test "Try to delete all clients" do
    Client.all.each do |c|
      assert c.destroy(), "Should delete client."
    end
  end
end
