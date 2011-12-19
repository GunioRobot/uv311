class AlterTableIssuesAddColumns < ActiveRecord::Migration
  def self.up
    #  user_id         :integer(4)
    #  aid             :string(255)
    #  address         :string(255)
    #  title           :string(255)
    #  description     :text
    #  service_type_id :string(255)
    #  token           :string(255)
    #  status          :string(255)
    add_column :issues, :description_date, :datetime
    add_column :issues, :description_title, :string
    add_column :issues, :description_subject, :string
    add_column :issues, :description_description, :string
    add_column :issues, :description_format, :string
    add_column :issues, :description_type, :string
    add_column :issues, :description_identifier, :string
    add_column :issues, :description_source, :string
    add_column :issues, :description_language, :string
    add_column :issues, :description_coverage, :string
    add_column :issues, :description_rights, :string
    add_column :issues, :description_accessrights, :string
    add_column :issues, :description_accrualmethod, :string
    add_column :issues, :description_accrualPeriodicity, :string
    add_column :issues, :description_modified, :datetime
    add_column :issues, :servicerequestid, :integer
    add_column :issues, :servicepriority, :string
    add_column :issues, :servicecode, :string
    add_column :issues, :servicecodedescription, :string
    add_column :issues, :servicetypecode, :string
    add_column :issues, :servicetypecodedescription, :string
    add_column :issues, :serviceorderdate, :datetime
    add_column :issues, :serviceorderstatus, :string
    add_column :issues, :servicecallcount, :integer
    add_column :issues, :agencyabbreviation, :string
    add_column :issues, :inspectionflag, :string
    add_column :issues, :inspectiondate, :datetime
    add_column :issues, :resolution, :string
    add_column :issues, :resolutiondate, :datetime
    add_column :issues, :serviceduedate, :datetime
    add_column :issues, :servicenotes, :string
    add_column :issues, :parentservicerequestid, :integer
    add_column :issues, :adddate, :datetime
    add_column :issues, :lastmodifieddate, :datetime
    add_column :issues, :siteaddress, :string
    add_column :issues, :zipcode, :string
    add_column :issues, :maraddressrepositoryid, :integer
    add_column :issues, :dcstataddresskey, :string
    add_column :issues, :dcstatlocationkey, :string
    add_column :issues, :ward, :string
    add_column :issues, :anc, :string
    add_column :issues, :smd, :string
    add_column :issues, :district, :string
    add_column :issues, :psa, :string
    add_column :issues, :neighborhoodcluster, :string
    add_column :issues, :hotspot2006name, :string
    add_column :issues, :hotspot2005name, :string
    add_column :issues, :hotspot2004name, :string
    add_column :issues, :lat, :float
    add_column :issues, :long, :float
    add_column :issues, :point, :string
  end

  def self.down
    remove_column :issues, :description_date
    remove_column :issues, :description_title
    remove_column :issues, :description_subject
    remove_column :issues, :description_description
    remove_column :issues, :description_format
    remove_column :issues, :description_type
    remove_column :issues, :description_identifier
    remove_column :issues, :description_source
    remove_column :issues, :description_language
    remove_column :issues, :description_coverage
    remove_column :issues, :description_rights
    remove_column :issues, :description_accessrights
    remove_column :issues, :description_accrualmethod
    remove_column :issues, :description_accrualPeriodicity
    remove_column :issues, :description_modified
    remove_column :issues, :servicerequestid
    remove_column :issues, :servicepriority
    remove_column :issues, :servicecode
    remove_column :issues, :servicecodedescription
    remove_column :issues, :servicetypecode
    remove_column :issues, :servicetypecodedescription
    remove_column :issues, :serviceorderdate
    remove_column :issues, :serviceorderstatus
    remove_column :issues, :servicecallcount
    remove_column :issues, :agencyabbreviation
    remove_column :issues, :inspectionflag
    remove_column :issues, :inspectiondate
    remove_column :issues, :resolution
    remove_column :issues, :resolutiondate
    remove_column :issues, :serviceduedate
    remove_column :issues, :servicenotes
    remove_column :issues, :parentservicerequestid
    remove_column :issues, :adddate
    remove_column :issues, :lastmodifieddate
    remove_column :issues, :siteaddress
    remove_column :issues, :zipcode
    remove_column :issues, :maraddressrepositoryid
    remove_column :issues, :dcstataddresskey
    remove_column :issues, :dcstatlocationkey
    remove_column :issues, :ward
    remove_column :issues, :anc
    remove_column :issues, :smd
    remove_column :issues, :district
    remove_column :issues, :psa
    remove_column :issues, :neighborhoodcluster
    remove_column :issues, :hotspot2006name
    remove_column :issues, :hotspot2005name
    remove_column :issues, :hotspot2004name
    remove_column :issues, :lat
    remove_column :issues, :long
    remove_column :issues, :point
  end
end
# <dcst:ServiceRequest xmlns:dcst="http://dc.gov/dcstat/types/1.0/">
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
#   <georss:point xmlns:georss="http://www.georss.org/georss">0 0</georss:point>
# </dcst:ServiceRequest>
