class AddCategoryToForum < ActiveRecord::Migration[6.0]
  def change
    change_table :forums do |t|
      t.belongs_to :category
    end
  end
end
