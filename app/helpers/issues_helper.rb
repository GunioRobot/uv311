module IssuesHelper
  
  def is_login(id)
    return  current_user.blank? ? new_user_path : vote_path(current_user,id)
  end
  
  def qualify_vote
      return  current_user.blank? ? 'facebox' : 'vote'
  end
end
