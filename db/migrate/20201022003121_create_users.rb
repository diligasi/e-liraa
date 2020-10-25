class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :cpf
      t.boolean :status
      t.integer :role, default: 3

      t.timestamps
    end
  end
end
