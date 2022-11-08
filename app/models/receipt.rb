class Receipt < ApplicationRecord

  validates :name, :total, :user_id, :group_id, presence: true

end