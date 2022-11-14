class User < ApplicationRecord

  attr_reader :password

  validates :email, :name, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }

  has_many :created_groups,
    class_name: "Group",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  has_many :receipts, 
    dependent: :destroy
  has_many :memberships
  has_many :groups, 
    through: :memberships
  has_many :friendships, 
    dependent: :destroy
  has_many :friends, 
    through: :friendships, 
      source: :user
  has_many :friend_requests,
    class_name: "FriendRequest",
    foreign_key: :requester_id,
    primary_key: :id

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def set_session_token
    self.session_token = SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def friend_requests
    FriendRequest.where("requester_id = ? OR requestee_id = ?", self.id, self.id)
  end

  private
  def ensure_session_token
    self.session_token ||= set_session_token
  end
end