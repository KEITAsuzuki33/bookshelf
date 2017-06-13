module ApplicationHelper
	  def correct_user?(user)
  	if current_user.nil?
  		return false
  	else
  		user.id.equal?(current_user.id)
  	end
  end
end
