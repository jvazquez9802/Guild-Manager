class AddForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title, null: false
      t.string :reason, null: false
      t.boolean :solved, null: false, default: false
      t.timestamps
    end
  end
end
