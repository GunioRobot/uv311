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

        servicerequestid = (doc/"dcst:servicerequestid").innerHTML
        issue = Issue.find_by_servicerequestid(servicerequestid)
        issue = Issue.new if issue.nil?       

        issue.description_date = (doc/"dc:date").innerHTML
        issue.description_title  = (doc/"dc:title").innerHTML
        issue.description_subject  = (doc/"dc:subject").innerHTML
        issue.description_description  = (doc/"dc:description").innerHTML
        issue.description_type  = (doc/"dc:type").innerHTML
        issue.description_format  = (doc/"dc:format").innerHTML
        issue.description_identifier  = (doc/"dc:identifier").innerHTML
        issue.description_source  = (doc/"dc:source").innerHTML
        issue.description_language  = (doc/"dc:language").innerHTML
        issue.description_coverage  = (doc/"dc:coverage").innerHTML
        issue.description_rights  = (doc/"dc:rights").innerHTML
        issue.description_accessrights  = (doc/"dcterms:accessRights").innerHTML
        issue.description_accrualmethod  = (doc/"dcterms:accrualMethod").innerHTML
        issue.description_accrualPeriodicity  = (doc/"dcterms:accrualPeriodicity").innerHTML
        issue.description_modified  = (doc/"dcterms:modified").innerHTML
        issue.servicerequestid  = (doc/"dcst:servicerequestid").innerHTML
        issue.servicepriority  = (doc/"dcst:servicepriority").innerHTML
        issue.servicecode  = (doc/"dcst:servicecode").innerHTML
        issue.servicecodedescription  = (doc/"dcst:servicecodedescription").innerHTML
        issue.servicetypecode  = (doc/"dcst:servicetypecode").innerHTML                
        issue.servicetypecodedescription  = (doc/"dcst:servicetypecodedescription").innerHTML
        issue.serviceorderdate  = (doc/"dcst:serviceorderdate").innerHTML
        issue.serviceorderstatus  = (doc/"dcst:serviceorderstatus").innerHTML
        issue.servicecallcount  = (doc/"dcst:servicecallcount").innerHTML
        issue.agencyabbreviation  = (doc/"dcst:agencyabbreviation").innerHTML
        issue.inspectionflag  = (doc/"dcst:inspectionflag").innerHTML
        issue.inspectiondate  = (doc/"dcst:inspectiondate").innerHTML
        issue.resolution  = (doc/"dcst:resolution").innerHTML
        issue.resolutiondate  = (doc/"dcst:resolutiondate").innerHTML
        issue.serviceduedate  = (doc/"dcst:serviceduedate").innerHTML
        issue.servicenotes  = (doc/"dcst:servicenotes").innerHTML
        issue.parentservicerequestid  = (doc/"dcst:parentservicerequestid").innerHTML
        issue.adddate  = (doc/"dcst:adddate").innerHTML
        issue.lastmodifieddate  = (doc/"dcst:lastmodifieddate").innerHTML
        issue.siteaddress  = (doc/"dcst:siteaddress").innerHTML
        issue.zipcode  = (doc/"dcst:zipcode").innerHTML
        issue.maraddressrepositoryid  = (doc/"dcst:maraddressrepositoryid").innerHTML
        issue.dcstataddresskey  = (doc/"dcstataddresskey").innerHTML
        issue.dcstatlocationkey  = (doc/"dcst:dcstatlocationkey").innerHTML
        issue.ward  = (doc/"dcst:ward").innerHTML
        issue.anc  = (doc/"dcst:anc").innerHTML
        issue.smd  = (doc/"dcst:smd").innerHTML
        issue.district  = (doc/"dcst:district").innerHTML
        issue.psa  = (doc/"dcst:psa").innerHTML
        issue.neighborhoodcluster  = (doc/"dcst:neighborhoodcluster").innerHTML
        issue.hotspot2006name  = (doc/"dcst:hotspot2006name").innerHTML
        issue.hotspot2005name  = (doc/"dcst:hotspot2005name").innerHTML
        issue.hotspot2004name  = (doc/"dcst:hotspot2004name").innerHTML
        issue.lat  = (doc/"geo:lat").innerHTML
        issue.long  = (doc/"geo:long").innerHTML
        issue.point  = (doc/"georss:point").innerHTML    
        #   <rdf:Description rdf:about="http://dc.gov/dcstat/types/1.0/ServiceRequest#2162632">          
        #     <dc:date>2009-06-18T03:01:43-04:00</dc:date>          
        #     <rdf:type rdf:resource="http://dc.gov/dcstat/types/1.0/ServiceRequest" />          
        #     <dc:title>dcst:ServiceRequest</dc:title>          
        #     <dc:subject>ServiceRequest ID:2162632</dc:subject>          
        #     <dc:description>Service requests placed at the District of Columbia's Mayor's Call Center and through the Service Request Center website. Includes service request order details.</dc:description>          
        #     <dc:type>http://dc.gov/dcstat/types/1.0/ServiceRequest</dc:type>          
        #     <dc:format>text/xml</dc:format>          
        #     <dc:identifier>http://dc.gov/dcstat/types/1.0/ServiceRequest#2162632</dc:identifier>          
        #     <dc:source>http://dc.gov/dcstat/datasets/src</dc:source>          
        #     <dc:language>en</dc:language>          
        #     <dc:coverage>District of Columbia</dc:coverage>          
        #     <dc:rights>public domain</dc:rights>          
        #     <dcterms:accessRights>http://dc.gov/dcstat/accessrights/Public</dcterms:accessRights>          
        #     <dcterms:accrualMethod>Hansen/SRC interface</dcterms:accrualMethod>          
        #     <!--  accrual periodicity is in seconds units --><dcterms:accrualPeriodicity>3600</dcterms:accrualPeriodicity>
        #     <dcterms:modified>2009-06-18T03:01:43-04:00</dcterms:modified>        
        #   </rdf:Description>        
        #   <dcst:servicerequestid>2162632</dcst:servicerequestid>        
        #   <dcst:servicepriority>NO VALUE ASSIGNED</dcst:servicepriority>        
        #   <dcst:servicecode>S05SL</dcst:servicecode>        
        #   <dcst:servicecodedescription>STREETLIGHT REPAIR</dcst:servicecodedescription>        
        #   <dcst:servicetypecode>S&AL</dcst:servicetypecode>        
        #   <dcst:servicetypecodedescription>STREET & ALLEY LIGHTS</dcst:servicetypecodedescription>
        #   <dcst:serviceorderdate>2009-06-18T02:36:33-04:00</dcst:serviceorderdate>        
        #   <dcst:serviceorderstatus>OPEN</dcst:serviceorderstatus>        
        #   <dcst:servicecallcount>1</dcst:servicecallcount>        
        #   <dcst:agencyabbreviation>DDOT</dcst:agencyabbreviation>        
        #   <dcst:inspectionflag>N</dcst:inspectionflag>        
        #   <dcst:inspectiondate></dcst:inspectiondate>        
        #   <dcst:resolution>NO VALUE ASSIGNED</dcst:resolution>        
        #   <dcst:resolutiondate></dcst:resolutiondate>        
        #   <dcst:serviceduedate>2009-06-29T02:36:33-04:00</dcst:serviceduedate>        
        #   <dcst:servicenotes></dcst:servicenotes>        
        #   <dcst:parentservicerequestid>0</dcst:parentservicerequestid>        
        #   <dcst:adddate>2009-06-18T02:36:33-04:00</dcst:adddate>        
        #   <dcst:lastmodifieddate>2009-06-18T02:40:03-04:00</dcst:lastmodifieddate>        
        #   <dcst:siteaddress></dcst:siteaddress>        
        #   <dcst:zipcode></dcst:zipcode>        
        #   <dcst:maraddressrepositoryid>-100</dcst:maraddressrepositoryid>        
        #   <dcst:dcstataddresskey>-100</dcst:dcstataddresskey>        
        #   <dcst:dcstatlocationkey>348291</dcst:dcstatlocationkey>        
        #   <dcst:ward>NONE</dcst:ward>        
        #   <dcst:anc>NONE</dcst:anc>        
        #   <dcst:smd>NONE</dcst:smd>        
        #   <dcst:district>NONE</dcst:district>        
        #   <dcst:psa>NONE</dcst:psa>        
        #   <dcst:neighborhoodcluster>NONE</dcst:neighborhoodcluster>        
        #   <dcst:hotspot2006name>NONE</dcst:hotspot2006name>        
        #   <dcst:hotspot2005name>NONE</dcst:hotspot2005name>        
        #   <dcst:hotspot2004name>NONE</dcst:hotspot2004name>        
        #   <geo:lat xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#">0</geo:lat>        
        #   <geo:long xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#">0</geo:long>        
        #   <georss:point xmlns:georss="http://www.georss.org/georss">0 0</georss:point>        # Title
        service_code_description = (doc/"dcst:servicecodedescription").innerHTML.downcase.titleize
        service_date = (doc/"dcst:serviceorderdate").innerHTML[0...10]  
        aid = (doc/"dcst:servicerequestid").innerHTML[0...10]   
            
        
        issue.title = service_code_description + " " +  service_date        
        
        #aid 
        issue.aid = aid
        
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
        issue.save  #rescue nil # "I know it's bad I just need to get it running and I will look into fixing that"              
      end

    end

  end
end
