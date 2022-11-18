class CustomSplit < ApplicationRecord

  validates :group_id, :total, :group_member_count, presence: true

  belongs_to :group

  

end