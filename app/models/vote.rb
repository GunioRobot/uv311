# Schema info: 20090607170409_create_votes
#
# Table name: votes
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  issue_id        :integer(4)
#  value           :integer(4)      for tracking positive/negative voting

class Vote < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :issue, :class_name => 'Issue', :foreign_key => 'issue_id'
end