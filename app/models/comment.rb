# == Schema Information
# Schema version: 20090606211445
#
# Table name: issues
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  name            :string(255)
#  body            :text
#  issue_id        :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :issue
end