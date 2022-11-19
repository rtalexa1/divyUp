class CustomSplit < ApplicationRecord

  validates :group_id, :total, :group_member_count, presence: true

  belongs_to :group

  # Takes in the total amount of a group and a hash with keys of group members' ids and values of custom percentages
  # Returns a has with keys of group members' ids and the dollar amount owed
  def self.calculate_custom_balances(total, percentages)
    custom_balances = {}
    i = 0
    percentages.each do |id, percentage|
      custom_balances[id] = (total.to_f * (percentage.to_i * 0.01)).round(2)
    end
    CustomSplit.equal_one_hundred(custom_balances, total)
  end

  def self.equal_one_hundred(balances, total)
    last_member = balances.keys[-1]
    actual_total = balances.values.inject(0) do |total, value|
      total += value
    end
    balances[last_member] += (total - actual_total).round(2)
    balances
  end
end