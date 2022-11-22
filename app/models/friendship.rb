class Friendship < ApplicationRecord

  validates :user_id, :friend_id, presence: true

  belongs_to :user, foreign_key: :friend_id
 
  # after_create do |f|
  #   if Friendship.where("friend_id = ? AND user_id = ?", f.user_id, f.friend_id).empty?
  #     Friendship.create(user_id: f.friend_id, friend_id: f.user_id, requester: false)
  #   end
  # end

  after_destroy do |f|
    inverse.destroy unless inverse.nil?
  end

  def accept!
    self.update(accepted: true)
    self.inverse.update(accepted: true)
  end

  private
  def inverse
    Friendship.where("user_id = ? AND friend_id = ?", self.friend_id, self.user_id)
  end
end
