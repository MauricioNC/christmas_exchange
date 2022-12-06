class ChangeGiftToFieldFromParticipantFromNotNulToNull < ActiveRecord::Migration[6.1]
  def change
    change_column :participants, :gift_to, :bigint, null: true
  end
end
