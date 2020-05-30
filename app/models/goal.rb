class Goal < ApplicationRecord
  has_many :achievements
  has_many :users, through: :achievements
  validates :category, presence: true
end
