class Contact < ActiveRecord::Base
  validates :name,
    presence: true,
    uniqueness: true,
    format: { with: /\A[a-zA-Z\-_]+\z/ },
    length: { minimum: 2 }
end
