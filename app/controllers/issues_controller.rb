class IssuesController < ApplicationController
  before_filter :adjust_format_for_mobile, :only => ["index", "new"]

  def index

    @issues = Issue.find(:all, :order => "created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # @issues = Issue.paginate :page => 1, :order => 'created_at DESC'
   
    # @issues = Issue.paginate_by_issue_id  @issue.id, :page => params[:page], :order => 'updated_at DESC',:per_page => 10
    
    
    respond_to do |format|
      logger.debug "format:: " + format.to_s
      format.mobile
      format.html # index.html.erb
      format.xml  { render :xml => @issues }
    end
  end

  def show_map
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  # GET /issues/1
  # GET /issues/1.xml
  def show
    @issue = Issue.find(params[:id])
    @comments = Comment.find(:all, :conditions => ["issue_id = ?", @issue.id], :order => "created_at DESC")
    @comment = Comment.new
    @comment.issue_id = @issue.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @issue }
    end
  end


  def new
    @services = ServiceType.all
    @attributes = ServiceTypeAttribute.find_all_by_service_type_id(1, :conditions => ["attribute_type<>''"])
    
    @attributes.each do |s|
      logger.debug "ONE::: " +s.inspect
    end
    
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.mobile
    end
  end
  
  def attributes
    @attributes = ServiceTypeAttribute.find_all_by_service_code(params[:id], :conditions => ["attribute_type<>''"])
    respond_to do |format|
#        format.js { render :json => @attributes.to_json}
        format.js { render :partial => "issues/new/custom_form.html.erb"}
    end
  end
  
  def create
    @issue = Issue.new(params[:issue])

    respond_to do |format|
      if @issue.save
        flash[:notice] = 'Issue was successfully created.'
        format.html { redirect_to(@issue) }
        format.xml  { render :xml => @issue, :status => :created, :location => @issue }
      else
        @services = ServiceType.all
        @attributes = ServiceTypeAttribute.find_all_by_service_type_id(1, :conditions => ["attribute_type<>''"])
        format.html { render :action => "new" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        flash[:notice] = 'Issue was successfully updated.'
        format.html { redirect_to(@issue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to(issues_url) }
      format.xml  { head :ok }
    end
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
