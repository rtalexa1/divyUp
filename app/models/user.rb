class User < ApplicationRecord

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  has_many :created_groups,
    class_name: "Group",
    foreign_key: :user_id,
    primary_key: :id
  has_many :receipts
  has_many :memberships
  has_many :groups, through: :memberships

end