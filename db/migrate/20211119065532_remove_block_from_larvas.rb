class RemoveBlockFromLarvas < ActiveRecord::Migration[6.1]
  def change
    remove_column :larvas, :block, :string
  end
end
