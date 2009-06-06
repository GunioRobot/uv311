# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def render_drill_layout(quads={},args={})
      column=args[:columns].blank? ? 24 : args[:columns]
      
      right_col_count = 38 - (column + 2)
      render :partial => "layouts/parts/drill", :locals => {
        :quad_welcome =>  quads[:welcome],
        :quad_index =>    quads[:contents],
        :quad_column =>   quads[:column],
        :quad_status =>   quads[:status],
        :title => args[:title] || @page_title || default_page_title,
        :sub_title => args[:subtitle],
        :sub_title_partial => args[:subtitle_partial],
        :columns => args[:columns].blank? ? 24 : args[:columns],
        :statusColumn => args[:statusColumn].blank? ? 13 : args[:statusColumn],
        :right_column => right_col_count,
        :left_column_id => args[:left_column_id].blank? ? 'leftcol' : args[:left_column_id],
        :right_column_id => args[:right_column_id].blank? ? 'rightcol' : args[:right_column_id],
        :prepend => args[:prepend].blank? ? '' : "prepend-#{args[:prepend]}", 
        :append => args[:append].blank? ? '' : "append-#{args[:append]}",
        :search => args[:search] || false
      }
  end
  
  def default_page_title
    params[:action].titleize
  end
  
  def render_flash_messages
    render :partial => "layouts/flash.html.erb", :locals => {:errors => flash[:error], :notice => flash[:notice], :warning => flash[:warning], :tag_class=>"pupl"}
  end
  
  
end
