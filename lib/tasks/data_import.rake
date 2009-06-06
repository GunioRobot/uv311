require 'dcgov'
namespace :data do
namespace :import do

  desc "initialize sphinx index and start"
  task :service_types , :needs => :environment do
    DCGOV::Open311.get_service_types().each do |item|
      ServiceType.create(:service_type => item.service_type, :service_code => item.service_code)
    end
  end
end
end
