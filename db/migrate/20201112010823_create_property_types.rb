class CreatePropertyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :property_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
