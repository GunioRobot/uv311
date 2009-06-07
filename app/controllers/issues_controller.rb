class IssuesController < ApplicationController
  
  def index
    @issues=Issue.find(:all, :limit => 5)
  end 
  
  def update
    
  end
  
  def vote
    if logged_in?
      @issue=Issue.find_by_id(params[:issue_id])
      if !@issue.nil?
        Vote.find_or_create_by_issue_id_and_user_id(@issue.id, current_user.id)
        return @issue.votes.count
      else
        #No issue found
        return false
      end
    else
      #User not logged in
      return false
    end
  end
  
  def show
    @issue = Issue.find(params[:id])
    @comments = Comment.find(:all, :conditions => ["issue_id = ?", @issue.id], :order => "created_at DESC")
    @comment = Comment.new
    @comment.issue_id = @issue.id
  end

end
