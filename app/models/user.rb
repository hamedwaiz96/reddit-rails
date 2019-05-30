class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Can't be blank" }
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_reader :password

  after_initialize :ensure_session_token

  def generate_random_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(:username => user_name)
    return user if user && user.is_password?(password)
    nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def reset_session_token!
    self.session_token = generate_random_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= generate_random_token
  end
end
