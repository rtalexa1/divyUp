class Friendship < ApplicationRecord

  validates :user_id, :friend_id, presence: true

  belongs_to :user, foreign_key: :friend_id
 
  after_create do |f|
    if !Friendship.find_by(friend_id: f.user_id)
      Friendship.create!(user_id: f.friend_id, friend_id: f.user_id)
    end
  end

  after_destroy do |f|
    reciprocal = Friendship.find_by(friend_id: f.user_id)
    reciprocal.destroy unless reciprocal.nil?
  end

end
