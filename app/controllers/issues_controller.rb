class IssuesController < ApplicationController
  
  def index
    @issues=Issue.find(:all, :limit => 5)
  end 
  
  def update
    
  end

  def vote
    # raise logged_in?
    #     if logged_in?
    #       @issue=Issue.find_by_id(params[:id])
    #       if !@issue.nil?
    #         Vote.find_or_create_by_issue_id_and_user_id(params[:id], current_user.id)
    #         return @issue.votes.count
    #       else
    #         #No issue found
    #         return false
    #       end
    #     else
    #       #User not logged in
    #       return false
    #     end
    respond_to do |format|
    
        flash[:notice] = 'Catechize was successfully updated.'
        format.js { head :ok}
        format.xml  { head :ok }
    
    end
    # format.json  { render :json => @asset.to_json(:include => :subject, :methods => :icon_for), :status => status }
  end
  
  def show
    @issue = Issue.find(params[:id])
    @comments = Comment.find(:all, :conditions => ["issue_id = ?", @issue.id], :order => "created_at DESC")
    @comment = Comment.new
    @comment.issue_id = @issue.id
  end

end
