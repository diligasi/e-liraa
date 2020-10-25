class AddDepartamentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :departament, foreign_key: true
  end
end
