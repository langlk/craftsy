module ApplicationHelper
  def authorize_edit?(review)
    current_user && (review.user == current_user)
  end

  def authorize_delete?(review)
    current_user && ((review.user == current_user) || current_user.admin?)
  end
end
