class CreateClientsContacts < ActiveRecord::Migration
  def change
    create_table :clients_contacts do |t|
      t.string :value, null: false
      t.belongs_to :client, index: true, null: false
      t.belongs_to :contact, index: true, null: false
      t.timestamps null: false
    end
  end
end
