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

  def even_divy
    (total.to_f / self.members.length).round(2)
  end

  def even_split_percentage
    (100 / self.members.length.to_f).round(2)
  end

end