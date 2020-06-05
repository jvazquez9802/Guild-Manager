class AddUsersToActivity < ActiveRecord::Migration[6.0]
  def change
    change_table :activities do |t|
      t.belongs_to :user
    end
  end
end
