class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = self.email.downcase }
  before_save { self.username = self.username.downcase }
  has_many :posts
  
    VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    VALID_USERNAME = /\A(?![.])(?![\s]{2})[a-zA-z_.0-9]+(?![.])\z/i
    VALID_PASSWORD_FORMAT = /((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]))+/i

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_FORMAT }
    validates :username, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_USERNAME }

    has_secure_password
    validates :password, format: { with: VALID_PASSWORD_FORMAT }

    class << self
      def digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end

      def generate_token
        SecureRandom.urlsafe_base64
      end

      def remember
        self.remember_token = generate_token
        self.update(:remember_digest, digest(remember_token))
      end
    end


    def forget
      update_attribute(:remember_digest, nil)
    end

    def authenticated?(remember_token)
      # return false if remember_digest.nil?

      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
