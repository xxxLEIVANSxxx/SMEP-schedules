class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.integer :number
      t.string :street
      t.string :neighborhood

      t.timestamps
    end
  end
end
