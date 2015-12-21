class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :cuilt, limit: 20, null: false
      t.date :birthdate, null: false
      t.integer :genre, null: false
      t.string :identification_number, limit: 15, null: false

      t.timestamps null: false
    end
    add_index :clients, :cuilt, unique: true
  end
end
