class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :guide
      t.belongs_to :forum

      t.timestamps
    end
  end
end
