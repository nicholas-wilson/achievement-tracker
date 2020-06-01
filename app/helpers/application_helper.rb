module ApplicationHelper
  def user_name(user)
    if !!user.uid
      user.facebook_name
    else
      user.username
    end
  end
end
