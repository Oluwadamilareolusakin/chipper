class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  
    VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    VALID_USERNAME = /\A(?![.])(?![\s]{2})[a-zA-z_.0-9]+(?![.])\z/i
    VALID_PASSWORD_FORMAT = /((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]))+/i

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_FORMAT }
    validates :username, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_USERNAME }

    has_secure_password
    validates :password, format: { with: VALID_PASSWORD_FORMAT }

    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

end
