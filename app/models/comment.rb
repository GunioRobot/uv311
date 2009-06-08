# == Schema Information
# Schema version: 20090607232528
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  author     :string(255)
#  body       :text
#  issue_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
end
