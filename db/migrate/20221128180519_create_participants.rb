class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :description
      t.boolean :is_raffled
      t.string :participant_link
      t.string :token

      t.timestamps
    end
  end
end
