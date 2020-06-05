class AddParticipantsToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :participants, :text
  end
end
