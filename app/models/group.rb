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

  # returns a hash with keys representing the user_id and the values representing the corresponding percentage
  def self.divy(total, percentages_hash)
    float_total = total.to_f
    individual_totals = {}
    percentages_hash.each do |id, percentage|
      individual_totals[id] = [percentage, (float_total * (percentage.to_i * 0.01)).round(2)]
    end
    individual_totals
  end

  # Return a hash of the keys representing the user_id and the values representing the same default value
  # Is there a simpler way of doing this?
  def even_split_hash
    individual_totals = {}
    self.members.each do |member|
    individual_totals[member.id.to_s] = [even_split_percentage, (self.total.to_f * (even_split_percentage * 0.01)).round(2)]
    end
    Group.reach_one_hundred(individual_totals)
  end

  def self.reach_one_hundred(individual_totals)
    percentage = individual_totals.values.inject(0) do |total, value|
      total += value[0]
    end
    individual_totals.values.last[0] += 100 - percentage
    individual_totals
  end

  def self.is_one_hundred?(individual_totals)
    percentages = individual_totals.values.map { |value| value[0].to_i }
    percentages.sum == 100
  end

  def even_split_percentage
    (100 / self.members.length.to_f).round(2)
  end

end