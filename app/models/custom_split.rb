class CustomSplit < ApplicationRecord

  validates :group_id, :total, :group_member_count, presence: true

  belongs_to :group

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

end