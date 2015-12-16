class Client < ActiveRecord::Base
  enum genre: {male: 0, female: 1}
  has_many :clients_contacts
  has_many :contacts, through: :clients_contacts
  has_many :invoices, dependent: :restrict_with_error
  has_many :people, through: :invoices

  validates :firstname, :lastname,
    presence: true,
    format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
    length: { minimum: 2, maximum: 30 }

  validates :genre,
    presence: true,
    inclusion: { in: self.genres.keys }

  validates :birthdate,
    presence: true,
    date: {
      after: Proc.new { Time.now - 100.year },
      before: Proc.new { Time.now - 18.year }
    }

  validates :cuilt,
    presence: true,
    format: { with: /\A\d{2}\-\d{8}\-\d{1}\z/, message: "must numerically with format XX-XXXXXXXX-X" },
    uniqueness: true

  validates :identification_number,
    presence: true,
    numericality: { only_integer: true },
    format: { with: /\A[0-9]+\z/, message: "only allows numbers" },
    length: { minimum: 6, maximum: 8 }
end
