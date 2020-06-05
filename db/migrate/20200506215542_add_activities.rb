class AddActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.datetime :start_time, null: false
      t.timestamps
    end
  end
end
