# == Schema Information
# Schema version: 20090606184710
#
# Table name: service_types
#
#  id         :integer(4)      not null, primary key
#  code       :integer(4)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ServiceTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
