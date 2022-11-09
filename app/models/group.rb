class Group < ApplicationRecord

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true

  belongs_to :creator,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  has_many :receipts
  has_many :memberships
  has_many :members,
    class_name: "User",
    through: :memberships,
    source: :user

  def total
    self.receipts.sum("total")
  end

  def divy
    total / self.members.length
  end

end