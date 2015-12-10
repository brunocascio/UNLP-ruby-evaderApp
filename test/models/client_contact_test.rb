require 'test_helper'

class ClientContactTest < ActiveSupport::TestCase
  test "Creates association with invalid data" do
    assert_not ClientContact.new(contact_id: nil, client_id: nil, value: nil).save(), "Shouldn't save the association with all data as nil"
    assert_not ClientContact.new(contact_id: contacts(:phone), client_id: nil, value: '1234567').save(), "Shouldn't save the association with client nil"
    assert_not ClientContact.new(contact_id: nil, client_id: clients(:client1), value: '1234567').save(), "Shouldn't save the association with contact nil"
    assert_not ClientContact.new(contact_id: contacts(:phone), client_id: clients(:client1), value: nil).save(), "Shouldn't save the association with value nil"
    assert_not ClientContact.new(contact_id: contacts(:phone), client_id: clients(:client1), value: '').save(), "Shouldn't save the association with value blank"
  end

  test "Creates association with valid data" do
    c = ClientContact.new
    c.contact = contacts(:skype)
    c.client = clients(:client1)
    c.value = '@client1Skype'
    assert c.save, "Should save the association"
  end

  test "Update contact associations" do
    c = ClientContact.first
    c.value = 'pepito'
    assert c.save, "Should save the association when updated the value"
    c.contact = contacts(:skype)
    assert c.save, "Should save the updated association when updated the contact"
    c.client = clients(:client2)
    assert c.save, "Should save the updated association when updated the client"
  end

  test "Removes contact associations" do
    ClientContact.all.each do |c|
      assert c.destroy()
    end
  end
end
