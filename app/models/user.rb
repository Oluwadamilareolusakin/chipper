class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  attr_accessor :remember_token, :activation_token
  before_create :create_activation_token
  before_save :downcase_credentials
  
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

      
    end
    
    def User.generate_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.generate_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    def is_admin?
      self.is_admin
    end

    def forget
      update_attribute(:remember_digest, nil)
    end


    def authenticated?(token, attribute)
      digest  = send("#{attribute}_digest")
      return false if digest.nil?

      BCrypt::Password.new(digest).is_password?(token)
    end

    def feed
      posts
    end
    

    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end
    
    def activate_user
      update_attribute(:activated, true)
      update_attribute(:activated_at, Time.zone.now)
    end

    private
      def create_activation_token
        self.activation_token = User.generate_token
        self.activation_digest = User.digest(:activation_token)
      end


      def downcase_credentials
        self.email.downcase!
        self.username = self.username.downcase
      end
end
