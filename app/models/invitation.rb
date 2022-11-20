class Invitation < ApplicationRecord

  validates :sender_id, :recipient_id, :group_id, presence: true

  belongs_to :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id
  belongs_to :recipient,
    class_name: "User",
    foreign_key: :recipient_id,
    primary_key: :id
  belongs_to :group
    
end