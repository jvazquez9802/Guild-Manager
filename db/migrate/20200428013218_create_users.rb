class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :family_name, null: false
      t.string :discord_tag, null: false
      t.text :description
      t.integer :rank, null: false, default: 0
      t.integer :atack, null: false, default: 0
      t.integer :atack_awake, null: false, default: 0
      t.integer :denfense, null: false, default: 0
      t.integer :gear_score, null: false, default: 0
      t.integer :branch, null: false, default: 0
      t.string :build_url, null: false, default: ""

      t.timestamps
    end
  end
end
