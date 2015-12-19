class Client < ActiveRecord::Base
  enum genre: {male: 0, female: 1}
  has_many :clients_contacts
  has_many :contacts, through: :clients_contacts
  accepts_nested_attributes_for :clients_contacts, reject_if: :all_blank, :allow_destroy => true
  has_many :invoices, dependent: :restrict_with_error
  has_many :people, through: :invoices

  validates :firstname, :lastname,
    presence: true,
    format: { with: /\A[\p{L}\s]+\z/, message: "only allows letters" },
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

  # Total of invoices on current year grouped by months
  def total_invoices_current_year_by_month
    self.invoices
      .select("strftime('%m', issue_date) as month, count(*) as total")
      .where("strftime('%Y', issue_date) = ?", Time.now.year.to_s)
      .group("strftime('%m', issue_date)")
      .order("strftime('%m', issue_date)")
  end

  # Amount total of invoices on current year
  def amount_total_invoices_by_year
    self.invoices
      .select("strftime('%Y', issue_date) as year, sum(amount) as total")
      .group("strftime('%Y', issue_date)")
      .order("strftime('%Y', issue_date)")
  end

  # Most invoiced people
  def most_invoiced_people
    self.people
      .select("people.id as pid, people.name as name, count(*) as total, sum(amount) as amount")
      .group("people.id")
      .order("amount DESC")
      .limit(5)
  end

  def full_name
    "#{self.firstname} #{self.lastname}"
  end

  def age
    age = Date.today.year - self.birthdate.year
    # for days before birthday
    age -= 1 if Date.today < self.birthdate + age.years
    age.to_i
  end

  def age_s
    "#{self.age.to_s} " << (I18n.t("years"))
  end

  def to_s
    self.full_name
  end
end
