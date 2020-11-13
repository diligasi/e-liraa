class CreateLarvaSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :larva_species do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
