class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Thank you for your comment!"
    else
      flash[:notice] = "Oops! Something went wrong."
    end
    redirect_to :controller => :issues, :action => :show, :id => @comment.issue_id    
  end
  
end
