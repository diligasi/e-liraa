class CreateFieldForms < ActiveRecord::Migration[6.0]
  def change
    create_table :field_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :property_type, null: false, foreign_key: true
      t.integer :visit_status
      t.text :visit_comment
      t.boolean :larvae_found
      t.boolean :larvicide
      t.boolean :rodenticide

      t.timestamps
    end
  end
end
