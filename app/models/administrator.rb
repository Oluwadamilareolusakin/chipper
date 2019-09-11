class Administrator < ApplicationRecord
  authenticates_with_sorcery!
  VALID_PASSWORD_FORMAT = /\A((?=.+[a-z])(?=.+[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]))+/i
  VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_FORMAT }, length: {minimum: 7}
  validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, uniqueness: true
  validates :name, presence: true
end
