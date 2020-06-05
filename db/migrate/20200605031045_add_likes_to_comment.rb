class AddLikesToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :likes, :text
  end
end
