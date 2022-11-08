class Group < ApplicationRecord

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true

end