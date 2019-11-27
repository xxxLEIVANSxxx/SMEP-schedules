class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :form
      t.boolean :status, default: false
      t.decimal :value
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
