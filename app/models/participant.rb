class Participant < ApplicationRecord
  has_secure_token :token, length: 36
  belongs_to :group, class_name: "Group", foreign_key: "group_id"

  validates_presence_of :name, on: :create, message: "can't be blank"

  validates_uniqueness_of :name, on: :create, message: "This participant already exist, try with other name"
  validates_uniqueness_of :participant_link, on: :create, message: "An error ocurred when registered, pleas try again"
end
