# == Schema Information
# Schema version: 20090606211445
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  name       :string(255)
#  body       :text
#  issue_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "when i post id should exist" do
    assert true
  end
end
