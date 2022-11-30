class Group < ApplicationRecord
  has_secure_token :token, length: 36
  has_many :participants

  validates_presence_of :group_name, on: :create, message: "can't be blank"
  validates_presence_of :token, on: :create, message: "An error ocurred when creating the group, plese try again"
  validates_presence_of :link, on: :create, message: "An error ocurred when creating the group, plese try again"

  validates_uniqueness_of :group_name, on: :create, message: "This name group already exist, try with other name"
  validates_uniqueness_of :token, on: :create, message: "An error ocurred when creating the group, plese try again"
  validates_uniqueness_of :link, on: :create, message: "An error ocurred when creating the group, plese try again"
end
