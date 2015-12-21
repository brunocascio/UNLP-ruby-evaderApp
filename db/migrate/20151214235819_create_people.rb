class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :person_type, null: false
      t.string :cuilt, limit: 20, null: false

      t.timestamps null: false
    end
    add_index :people, :cuilt, unique: true
  end
end
