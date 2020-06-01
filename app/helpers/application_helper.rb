module ApplicationHelper
  def user_name(user)
    if !!user.uid
      user.facebook_name
    else
      user.username
    end
  end

  def achievement_status(achievement)
    if achievement.completed
      "Completed - "
    else
      "In Progress - "
    end
  end
end
