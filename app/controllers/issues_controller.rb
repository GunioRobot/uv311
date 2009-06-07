class IssuesController < ApplicationController
  
  def index
    @issues=Issue.find(:all, :limit => 5)
  end 
  
  def update
    
  end
  def vote
    #if valid user (current_user)
    ##if is valid issue_id && user !has voted for issue
    ###save user_id, issue_id to new vote
    ##return new vote count for issue
  end
  
  def show
    @issue = Issue.find(params[:id])
    @comments = Comment.find(:all, :conditions => ["issue_id = ?", @issue.id], :order => "created_at DESC")
    @comment = Comment.new
    @comment.issue_id = @issue.id
  end
end
