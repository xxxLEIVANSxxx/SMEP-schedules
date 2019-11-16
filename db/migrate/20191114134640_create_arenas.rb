class CreateArenas < ActiveRecord::Migration[5.2]
  def change
    create_table :arenas do |t|
      t.string :name
      t.integer :number
      t.string :street
      t.string :neighborhood

      t.timestamps
    end
  end
end
