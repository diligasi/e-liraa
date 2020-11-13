class CreateTestTubes < ActiveRecord::Migration[6.0]
  def change
    create_table :test_tubes do |t|
      t.string :code
      t.references :shed_type, foreign_key: true
      t.integer :collected_amount
      t.text :comments
      t.references :field_form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
