class Patient < ApplicationRecord

  attr_accessor :remember_token , :activation_token


  before_save :downcase_email
  # before_create :create_activation_digest

  validates :name , presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email, presence: true, length: { maximum: 255 },
   format: { with: VALID_EMAIL_REGEX }, uniqueness: true)

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def Patient.digest(string)
    # def self.digest(string)
    # def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

  # Remember a patient in database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns a random token.
    def Patient.new_token
    # def self.new_token
    # def new_token
      SecureRandom.urlsafe_base64
    end

  # Remember a patient in database for use in persistent sessions
  def remember
    self.remember_token = Patient.new_token
    update_attribute(:remember_digest, Patient.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  # def create_activation_digest
  #   self.activation_token = Patient.new_token
  #   self.activation_digest = Patient.digest(activation_token)
  # end
end
