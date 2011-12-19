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
require 'faker'

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [Issue, Comment,ServiceType].each(&:delete_all)

    user = User.new
    user.email = Faker::Internet.email
    user.login_count = rand()
    user.save

    (1..20).each do |index|
      issue = Issue.new
      issue.title = Faker::Lorem.sentence
      issue.user_id = user.id
      issue.address = Faker::Address.street_address(true)
      issue.description = Faker::Lorem.paragraph
      issue.save

      (1..5).each do |i|
        comment = Comment.new
        comment.user_id = user.id
        comment.issue_id = issue.id
        comment.author = Faker::Name.name
        comment.body = Faker::Lorem.paragraph
        comment.save
      end
    end

  end
end
