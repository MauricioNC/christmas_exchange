class ChangeParticipantLinkToUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :participants, :participant_link, unique: true
  end
end
