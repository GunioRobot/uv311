# == Schema Information
# Schema version: 20090607171906
#
# Table name: votes
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  issue_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  value      :integer(4)
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
