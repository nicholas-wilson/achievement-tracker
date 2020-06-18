class Achievement < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :value, format: { with: /[0-9]/, message: " must be a number"}
  scope :completed, -> { where(completed: true)} # make sure to use this to sort by completed
end
