# == Schema Information
# Schema version: 20090606184710
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
#  perishable_token  :string(255)     default(""), not null
#  string            :string(255)     default(""), not null
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
end
