class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :neighborhood

      t.timestamps
    end
  end
end
