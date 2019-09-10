class User < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :email, presence: true, uniqueness: true
    validates :gender, presence: true
    validates :nationality, presence: true
    validates :username, presence: true, length: { maximum: 15 }, uniqueness: true
end
