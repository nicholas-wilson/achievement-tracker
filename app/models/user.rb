class User < ApplicationRecord
  has_many :goals
  has_many :achievements, through: :goals
  has_secure_password
end
