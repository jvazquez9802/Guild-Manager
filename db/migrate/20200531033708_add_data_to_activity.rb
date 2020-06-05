class AddDataToActivity < ActiveRecord::Migration[6.0]
  def change
    change_table :activities do |t|
      t.string :channel, null: false
    end
  end
end
