class ChangeTokenToUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :groups, :group_name, unique: true
    add_index :groups, :link, unique: true
    add_index :groups, :token, unique: true
  end
end
