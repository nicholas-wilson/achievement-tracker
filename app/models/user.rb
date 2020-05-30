class User < ApplicationRecord
  has_many :achievements
  has_many :goals, through: :achievements
  has_secure_password
  
  def achievement_score
    score = 0
    self.achievements.each do |achievement|
      if achievement.completed
        score += achievement.value
      end
    end
    score
  end

  def facebook_account?
    if self.uid.nil?
      false
    else
      true
    end
  end
end
