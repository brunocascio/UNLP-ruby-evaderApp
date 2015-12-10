class Contact < ActiveRecord::Base
  has_many :clients_contacts
  has_many :clients, through: :clients_contacts

  validates :name,
    presence: true,
    uniqueness: true,
    format: { with: /\A[a-zA-Z\-_]+\z/ },
    length: { minimum: 2 }
end
