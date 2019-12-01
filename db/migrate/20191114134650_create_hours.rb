class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.time :time
      t.date :date
      t.decimal :cost
      t.references :arena, foreign_key: true

      t.timestamps
    end
  end
end
