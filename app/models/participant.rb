class Participant < ApplicationRecord
  belongs_to :group, class_name: "group", foreign_key: "group_id"

  validates_presence_of :name, on: :create, message: "can't be blank"

  validates_uniqueness_of :participant_link, on: :create, message: "An error ocurred when registered, pleas try again"
end
