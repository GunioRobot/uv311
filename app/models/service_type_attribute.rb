# == Schema Information
# Schema version: 20090607182912
#
# Table name: service_type_attribute
#
#  id           :integer(4)      not null, primary key
#  311_id       :string(255)
#  service_type :string(255)
#  service_code :string(255)
#  name         :string(255)
#  prompt       :text
#  required     :boolean
#  type         :string
#  width        :integer
#  service_type_id :integer
#  
#

class ServiceTypeAttribute < ActiveRecord::Base
  belongs_to :service_type, :class_name => 'ServiceType', :foreign_key => 'service_type_id'
end
