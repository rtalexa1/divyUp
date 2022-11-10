class User < ApplicationRecord

  attr_reader :password

  validates :email, :name, :session_token, :password_digest presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }

  has_many :created_groups,
    class_name: "Group",
    foreign_key: :user_id,
    primary_key: :id
  has_many :receipts
  has_many :memberships
  has_many :groups, through: :memberships

  after_initialize :ensure_session_token

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

  private
  def ensure_session_token
    self.session_token |= set_session_token
  end
end