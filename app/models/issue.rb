# == Schema Information
# Schema version: 20090618075534
#
# Table name: issues
#
#  id                             :integer(4)      not null, primary key
#  user_id                        :integer(4)
#  aid                            :string(255)
#  address                        :string(255)
#  title                          :string(255)
#  description                    :text
#  service_type_id                :string(255)
#  token                          :string(255)
#  created_at                     :datetime
#  updated_at                     :datetime
#  status                         :string(255)
#  description_date               :datetime
#  description_title              :string(255)
#  description_subject            :string(255)
#  description_description        :string(255)
#  description_format             :string(255)
#  description_type               :string(255)
#  description_identifier         :string(255)
#  description_source             :string(255)
#  description_language           :string(255)
#  description_coverage           :string(255)
#  description_rights             :string(255)
#  description_accessrights       :string(255)
#  description_accrualmethod      :string(255)
#  description_accrualPeriodicity :string(255)
#  description_modified           :datetime
#  servicerequestid               :integer(4)
#  servicepriority                :string(255)
#  servicecode                    :string(255)
#  servicecodedescription         :string(255)
#  servicetypecode                :string(255)
#  servicetypecodedescription     :string(255)
#  serviceorderdate               :datetime
#  serviceorderstatus             :string(255)
#  servicecallcount               :integer(4)
#  agencyabbreviation             :string(255)
#  inspectionflag                 :string(255)
#  inspectiondate                 :datetime
#  resolution                     :string(255)
#  resolutiondate                 :datetime
#  serviceduedate                 :datetime
#  servicenotes                   :string(255)
#  parentservicerequestid         :integer(4)
#  adddate                        :datetime
#  lastmodifieddate               :datetime
#  siteaddress                    :string(255)
#  zipcode                        :string(255)
#  maraddressrepositoryid         :integer(4)
#  dcstataddresskey               :string(255)
#  dcstatlocationkey              :string(255)
#  ward                           :string(255)
#  anc                            :string(255)
#  smd                            :string(255)
#  district                       :string(255)
#  psa                            :string(255)
#  neighborhoodcluster            :string(255)
#  hotspot2006name                :string(255)
#  hotspot2005name                :string(255)
#  hotspot2004name                :string(255)
#  lat                            :float
#  long                           :float
#  point                          :string(255)
#

class Issue < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :service_type, :class_name => 'ServiceType', :foreign_key => 'service_type_id'
  has_many :comments
  has_many :votes, :class_name => 'Vote'
  
  after_create :submit_issue

  def type
    "type"
  end  
  
  def type=()
  end  

  def submit_issue
    # can use code below to get the fields for the issue. need to figure out how to get the service_code
    #request_fields = DCGOV::Open311.get_request_fields("S0000")
    DCGOV::Open311.submit(:aid => aid, :description => description) if Rails.env == 'production'
  end
end
