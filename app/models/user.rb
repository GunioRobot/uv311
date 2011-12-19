# == Schema Information
# Schema version: 20090607232528
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  login_count       :integer(4)
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  name              :string(255)     default(""), not null
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic

  has_many :issues, :class_name => 'Issue', :foreign_key => 'user_id'
  has_many :comments, :class_name => 'Comment', :foreign_key => 'user_id'
  has_many :votes, :class_name => 'Vote', :foreign_key => 'user_id'

  validates_confirmation_of :password

end
