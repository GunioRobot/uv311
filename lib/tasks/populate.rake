# ISSUE MODEL
#  user_id         :integer(4)
#  aid             :string(255)
#  address         :string(255)
#  title           :string(255)
#  description     :text
#  service_type_id :string(255)
#  token           :string(255)

# SERVICE TYPE
#  code       :integer(4)
#  name       :string(255)

# USER
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

namespace :db do    
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    [Issue, Comment,ServiceType].each(&:delete_all)
    
    User.populate 20 do |user|
      user.email = Faker::Internet.email
      user.login_count = rand()
      user.string = Faker::Lorem.sentences(3)
      user.perishable_token = "336717a62efc416f0d4ebc298716d567bbdedf33"
      user.last_login_ip = "192.168.1.101"
      user.current_login_ip = "192.168.1.101"
      Issue.populate 10..12 do |issue|
          issue.title = Faker::Lorem.sentences()
          issue.user_id = user.id
          issue.address = Faker::Address.street_address(true)
          issue.description= Populator.words(30..40).titleize 
      end
    end

  end
end