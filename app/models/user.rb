class User < ApplicationRecord
  has_many :achievements
  has_many :goals, through: :achievements
  has_secure_password
end
