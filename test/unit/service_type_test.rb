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

require 'test_helper'

class ServiceTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
