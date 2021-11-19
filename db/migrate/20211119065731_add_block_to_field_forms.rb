class AddBlockToFieldForms < ActiveRecord::Migration[6.1]
  def change
    add_column :field_forms, :block, :string
  end
end
