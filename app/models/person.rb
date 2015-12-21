class Person < ActiveRecord::Base
  enum person_type: {fisic: 0, juridic: 1}
  has_many :invoices, dependent: :restrict_with_error
  has_many :clients, through: :invoices

  validates :name,
    presence: true,
    format: { with: /\A[\p{L}\s.]+\z/ },
    length: { minimum: 2, maximum: 30 }

  validates :person_type,
    presence: true,
    inclusion: { in: self.person_types.keys }

  validates :cuilt,
    presence: true,
    uniqueness: true,
    format: { with: /\A\d{2}\-\d{8}\-\d{1}\z/ }

  def to_s
    "#{self.name} (#{self.cuilt})"
  end
end
