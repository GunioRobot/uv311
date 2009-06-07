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
        service_code_description = (doc/"dcst:servicecodedescription").innerHTML        
      end

    end

  end
end
