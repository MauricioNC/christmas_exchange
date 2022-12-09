class Participant < ApplicationRecord
  has_secure_token :token, length: 36
  belongs_to :group, class_name: "Group", foreign_key: "group_id"

  validates_presence_of :name, on: :create, message: "can't be blank"

  validate :unique_participant_per_group, on: :create
  validates_uniqueness_of :participant_link, on: :create, message: "An error ocurred when registered, pleas try again"

  private

  def unique_participant_per_group
    pp self.name
    pp self.group.participants.where(name: self.name).any?
    self.errors.add(:name, "This participant already exist, try with other name") if self.group.participants.where(name: self.name).any?
  end
end
