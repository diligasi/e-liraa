class CreateInstitutionals < ActiveRecord::Migration[6.0]
  def change
    create_table :institutionals do |t|
      t.text :description
      t.string :phone_numbers
    end
  end
end
