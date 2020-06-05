class AddGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.belongs_to :user
      t.belongs_to :category
      t.timestamps
    end
  end
end
