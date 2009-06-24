# == Schema Information
# Schema version: 20090621165426
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
#  severity                       :string(255)     default("non-emergency")
#  picture_file_name              :string(255)
#  picture_content_type           :string(255)
#  picture_file_size              :integer(4)
#  picture_updated_at             :datetime
#  service_request                :string(255)
#

class Issue < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :service_type, :class_name => 'ServiceType', :foreign_key => 'service_type_id'
  has_many :comments
  has_many :votes, :class_name => 'Vote'
  
  has_attached_file :picture,
  :styles => {
      :thumb=> "100x100>",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" },
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => ":attachment/:id/:style.:extension",
      :bucket => 'easy311'      
  # has_attached_file :photo, :styles => { :small => "150x150>" },
  #                   :url  => "/assets/products/:id/:style/:basename.:extension",
  #                   :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

#  validates_attachment_presence :picture
#  validates_attachment_size :picture, :less_than => 1.megabyte

  
  
  after_create :submit_issue

  def srv_attributes
    @atts
  end
  
  def srv_attributes=(atts)
    @atts
  end  

  def submit_issue
    # can use code below to get the fields for the issue. need to figure out how to get the service_code
    #request_fields = DCGOV::Open311.get_request_fields("S0000")
    DCGOV::Open311.submit(:aid => aid, :description => description) if Rails.env == 'production'
  end
  
  def issues_with_address(address)
    @issues = Issue.find(:all, :conditions => ['address LIKE lower(?) OR title LIKE lower(?)', "%#{address}%", "%#{address}%"])
  end
end
