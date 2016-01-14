class ClientsContact < ActiveRecord::Base
  validates_presence_of :client
  validates_presence_of :contact
  validates_presence_of :value

  belongs_to :client
  belongs_to :contact
end
