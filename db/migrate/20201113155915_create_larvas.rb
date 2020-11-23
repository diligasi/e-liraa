class CreateLarvas < ActiveRecord::Migration[6.0]
  def change
    create_table :larvas do |t|
      t.references :test_tube, null: false, foreign_key: true
      t.references :larva_specy, null: false, foreign_key: true
      t.string :block
      t.text :comments

      t.timestamps
    end
  end
end
