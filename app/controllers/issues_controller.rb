class IssuesController < ApplicationController
  
  def index
    @issues=Issue.find(:all, :limit => 5)
  end 
  
  def update
    
  end
end
