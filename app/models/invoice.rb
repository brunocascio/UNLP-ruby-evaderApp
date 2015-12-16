class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  validates :client, :person,
    presence: true

  validates :issue_date,
    presence: true,
    date: {
      after: Proc.new { Time.now - 10.year },
      before: Proc.new { Time.now + 50.year }
    }

  validates :description,
    presence: true,
    length: { minimum: 2 }

  validates :amount,
    presence: true,
    numericality: { greater_than_or_equal_to: 1.00}
end
