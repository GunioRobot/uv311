class IssuesController < ApplicationController
  
  def index
    @issues=Issue.find(:all, :limit => 15)
  end 
  
  def update
    
  end

  def vote
     @issue=Issue.find_by_id(params[:id])
     firstcount= @issue.votes.count
     if !@issue.nil?
       Vote.find_or_create_by_issue_id_and_user_id(params[:id], current_user.id)
       # raise @issue.votes.count.to_yaml
       count= @issue.votes.count
       status=count>firstcount ? 202 :200        
     else
       #No issue found
       return false
     end
  

     respond_to do |format|
       if count
         flash[:notice] = 'count was successfully updated.'
         format.js { head status}
         format.xml  { head :ok }
       end
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
