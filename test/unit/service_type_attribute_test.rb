# == Schema Information
# Schema version: 20090620201029
#
# Table name: service_type_attributes
#
#  id              :integer(4)      not null, primary key
#  id_311          :string(255)
#  name            :string(255)
#  prompt          :text
#  required        :boolean(1)
#  attribute_type  :string(255)
#  width           :integer(4)
#  item_list       :text
#  created_at      :datetime
#  updated_at      :datetime
#  service_type_id :integer(4)
#  service_code    :string(255)
#

require 'test_helper'

class ServiceTypeAttributeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
