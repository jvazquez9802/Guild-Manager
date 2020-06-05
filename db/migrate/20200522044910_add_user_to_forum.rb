class AddUserToForum < ActiveRecord::Migration[6.0]
  def change
    change_table :forums do |t|
      t.belongs_to :user
    end
  end
end
