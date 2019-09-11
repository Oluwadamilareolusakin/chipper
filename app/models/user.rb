class User < ApplicationRecord
  VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    VALID_USERNAME = /\A(?![.])(?![\s]{2})[a-zA-z_.0-9]+(?![.])\z/i
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_FORMAT }
    validates :username, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_USERNAME }
end
