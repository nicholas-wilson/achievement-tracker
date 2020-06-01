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

  def unique_goals
    self.goals.pluck(:category).uniq
  end

  def self.find_or_create_facebook_account(params)
    user = User.find_by(uid: params["uid"])
    if !user
      user = User.new
      user.uid = params["uid"]
      user.facebook_name = params['info']["name"]
      user.password = "fake"
      user.save
    end
    user
  end

  def facebook_account?
    if self.uid.nil?
      false
    else
      true
    end
  end
end
