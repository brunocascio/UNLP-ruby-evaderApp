class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :description, null: false
      t.decimal :amount, null: false
      t.date :issue_date, null: false
      t.belongs_to :client, index: true, null: false
      t.belongs_to :person, index: true, null: false

      t.timestamps null: false
    end
  end
end
