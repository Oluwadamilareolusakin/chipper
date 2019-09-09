class Administrator < ApplicationRecord
  authenticates_with_sorcery!
  VALID_PASSWORD_FORMAT = /\A((?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]))+/i
  VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 15 }
  validates :password, presence: true, format: { with: VALID_PASSWORD_FORMAT }, length: {minimum: 7}
  validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT } 
  validates :name, presence: true
end
