require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "Creates invoices with valid data" do
    invoices().each do |i|
      assert i.save
    end
  end

  test "Try to invoice person without data" do
    assert_not Invoice.new().save()
  end

  test "Try to creates invoices with blank data" do
    assert_not Invoice.new(
      description: '',
      amount: 10.00,
      issue_date: Time.now,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    assert_not Invoice.new(
      description: 'description..',
      amount: nil,
      issue_date: Time.now,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    assert_not Invoice.new(
      description: 'description..',
      amount: 10.00,
      issue_date: '',
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    assert_not Invoice.new(
      description: 'description..',
      amount: 10.00,
      issue_date: Time.now,
      client: nil,
      person: people(:personWithName))
    .save()

    assert_not Invoice.new(
      description: 'description..',
      amount: 10.00,
      issue_date: Time.now,
      client: clients(:client1),
      person: nil)
    .save()
  end

  test "Try to creates invoices with invalid data" do
    # Invoice with short description
    assert_not Invoice.new(
      description: 'a',
      amount: 10.00,
      issue_date: Time.now,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoice with amount 0
    assert_not Invoice.new(
      description: 'description',
      amount: 0.00,
      issue_date: Time.now,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoice with amount non-numeric
    assert_not Invoice.new(
      description: 'description',
      amount: 'sarasa',
      issue_date: Time.now,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoice with invalid date
    assert_not Invoice.new(
      description: 'description',
      amount: 10.0,
      issue_date: '1293-111-15',
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoices with invalid date year ()
    assert_not Invoice.new(
      description: 'description',
      amount: 10.0,
      issue_date: Time.now - 50.year,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoices with invalid date year ()
    assert_not Invoice.new(
      description: 'description',
      amount: 10.0,
      issue_date: Time.now - 10.year,
      client: clients(:client1),
      person: people(:personWithName))
    .save()

    # Invoices with invalid date formats (unordered)
    assert_not Invoice.new(
      description: 'description',
      amount: 10.0,
      issue_date: '12/2015/15',
      client: clients(:client1),
      person: people(:personWithName))
    .save()
  end

  test "Try to delete all invoices" do
    Invoice.all.each do |i|
      assert i.destroy(), "Should delete the invoice."
    end
  end
end
