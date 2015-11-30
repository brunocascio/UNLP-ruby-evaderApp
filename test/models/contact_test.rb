require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "Creates contact with valid data" do
    assert Contact.new(name: 'other').save(), "Should save a new contact with valid data"
    assert_equal 5, Contact.count
  end

  test "Try to create contact without data" do
    assert_not Contact.new().save(), "Shouldn't create a new contact without attributes"
  end

  test "Try to creates contact with blank data" do
    assert_not Contact.new(name: '').save(), "Shouldn't create a new contact with blank name"
  end

  test "Try to creates contact with invalid data" do
    assert_not Contact.new(name: '1234').save(), "Shouldn't create a new contact with numeric name"
    assert_not Contact.new(name: 'a').save(), "Shouldn't create a new contact with < 2 chars"
  end

  test "Try to creates contact with duplicated type" do
    assert_not Contact.new(name: 'email').save(), "Shouldn't create a new contact with duplicated name"
  end
end
