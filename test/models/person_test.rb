require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Creates people with valid data" do
    people().each do |p|
      assert p.save, "Should save a new person with valid data"
    end
  end

  test "Try to create person without data" do
    assert_not Person.new().save(), "Shouldn't create a new person without attributes"
  end

  test "Try to creates people with blank data" do
    assert_not Person.new(name: '', person_type: 'juridic', cuilt: '20-1235434-7').save(), "Shouldn't create a new person with blank name"
    assert_not Person.new(name: 'Name of a person', person_type: '', cuilt: '20-1235434-7').save(), "Shouldn't create a new person with blank person_type"
    assert_not Person.new(name: 'Name of a person', person_type: 'fisic', cuilt: '').save(), "Shouldn't create a new person with blank cuit"
  end

  test "Try to creates people with invalid data" do
    assert_not Person.new(name: '1234', person_type: 'juridic', cuilt: '20-1235434-7').save(), "Shouldn't create a new person with numeric name"
    assert_not Person.new(name: 'a', person_type: 'juridic', cuilt: '20-1235434-7').save(), "Shouldn't create a new person with < 2 chars"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '209812-asas-1').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '209812').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '20-12-12').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '2-1-1').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '0-0-0').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '--').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '00000000--').save(), "Shouldn't create a new person with invalid cuil/cuit format"
    assert_not Person.new(name: 'name of person', person_type: 'juridic', cuilt: '0-0000000-').save(), "Shouldn't create a new person with invalid cuil/cuit format"
  end

  test "Try to creates person with duplicated cuilt" do
    people(:personWithName).save()
    assert_not Person.new(cuilt: people(:personWithName).cuilt, name: 'other person', person_type: 'fisic').save(), "Shouldn't create a new person with duplicated cuilt"
  end

  test "Try to delete all contacts" do
    Person.all.each do |c|
      assert c.destroy(), "Should delete person #{c.id}: #{c.name}."
    end
  end
end
