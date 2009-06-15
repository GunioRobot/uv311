# == Schema Information
# Schema version: 20090607232528
#
# Table name: issues
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  aid             :string(255)
#  address         :string(255)
#  title           :string(255)
#  description     :text
#  service_type_id :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  status          :string(255)
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
    DCGOV::Open311.submit(:aid => aid, :description => description) if Rails.env == 'production'
  end
end
