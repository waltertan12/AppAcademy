class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true

  after_initialize :ensure_session_token

  has_many :cats

  has_many :user_sessions

  has_many :cat_rental_requests

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return unless user
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = generate_token
    self.save!
  end

  def generate_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
