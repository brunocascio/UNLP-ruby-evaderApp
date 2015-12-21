class ClientsContact < ActiveRecord::Base
  validates :client, :contact, :value, presence: true
  belongs_to :client
  belongs_to :contact
end
