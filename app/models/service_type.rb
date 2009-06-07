# == Schema Information
# Schema version: 20090606211445
#
# Table name: service_types
#
#  id           :integer(4)      not null, primary key
#  service_code :string(255)
#  service_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ServiceType < ActiveRecord::Base
  has_many :issues
  has_many :service_type_attributes, :class =>  'ServiceTypeAttribute', :foreign_key => 'service_type_id'
end
