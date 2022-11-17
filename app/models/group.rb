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

  # returns a hash with keys representing the input percentages and the values representing the corresponding $ amount
  def self.divy(percentages, total)
    float_total = total.to_f
    individual_totals = {}
    percentages.each do |percentage|
      individual_totals[percentage] = (float_total * (percentage * 0.01)).round(2)
    end
    individual_totals
  end

  def even_split_percentage
    (100 / self.members.length.to_f).round(2)
  end

end