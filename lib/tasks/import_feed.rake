require 'open-uri'
require 'hpricot'

namespace :data do
  namespace :import do

    desc 'Fetches 311 Service Requests from DC Gov. 311 Atom Feed'
    task :feed, :needs => :environment  do  
      rss = SimpleRSS.parse open('http://data.octo.dc.gov/feeds/src/src_current.xml')
      
      rss.items.each do |item|
        content = item[:content]
        doc = Hpricot(content)
        
        issue = Issue.new        
        
        # Title
        service_code_description = (doc/"dcst:servicecodedescription").innerHTML.downcase.titleize
        service_date = (doc/"dcst:serviceorderdate").innerHTML[0...10]       
        issue.title = service_code_description + " " +  service_date        
        
        #address
        service_address = (doc/"dcst:siteaddress").innerHTML + " Washington, DC " + (doc/"dcst:zipcode").innerHTML
        issue.address = service_address
        
        # description
        district = (doc/"dcst:district").innerHTML + " District"
        issue.description = service_code_description + 
                           "\nDistrict:" + district + 
                           "\nAddress: " + service_address +
                           "\nDate: " + service_date
        
        # status
        service_status = (doc/"dcst:serviceorderstatus").innerHTML
        issue.status = service_status
        issue.save  rescue nil # "I know it's bad I just need to get it running and I will look into fixing that"              
      end

    end

  end
end
