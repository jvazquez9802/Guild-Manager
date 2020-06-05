class AddDislikesToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :dislikes, :text
  end
end
