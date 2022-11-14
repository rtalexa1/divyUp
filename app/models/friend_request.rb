class FriendRequest < ApplicationRecord
  validates :requester_id, :requestee_id, presence: true
end