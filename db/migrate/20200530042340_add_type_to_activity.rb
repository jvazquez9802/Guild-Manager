class AddTypeToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :category, :integer, null:false, default: 0
  end
end
