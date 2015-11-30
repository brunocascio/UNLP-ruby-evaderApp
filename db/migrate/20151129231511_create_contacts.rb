class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :contacts, :name, unique: true
  end
end
