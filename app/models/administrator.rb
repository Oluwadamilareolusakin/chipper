class Administrator < ApplicationRecord
  authenticates_with_sorcery!
  VALID_PASSWORD_FORMAT = /((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]))+/i
  VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_USERNAME = /\A(?![.])(?![\s]{2})[a-zA-z_.0-9]+(?![.])\z/i
  
  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_USERNAME }
  validates :password, presence: true, format: { with: VALID_PASSWORD_FORMAT }, length: {minimum: 7}
  validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, uniqueness: true
  validates :name, presence: true
end
