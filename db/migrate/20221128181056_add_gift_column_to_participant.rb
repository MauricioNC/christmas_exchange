class AddGiftColumnToParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :gift_to, :bigint, null: false, default: nil
  end
end
