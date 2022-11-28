class AddGroupToParticipant < ActiveRecord::Migration[6.1]
  def change
    add_reference :participants, :group, null: false, foreign_key: true
  end
end
