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

require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
