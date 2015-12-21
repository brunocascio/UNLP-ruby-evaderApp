class Contact < ActiveRecord::Base
  has_many :clients_contacts
  has_many :clients, through: :clients_contacts

  validates :name,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\p{L}\s\-_]+\z/ },
    length: { minimum: 2 }

  def to_s
    self.name
  end
end
