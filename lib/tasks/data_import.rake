namespace :data do
	namespace :import do

		desc "Fetch service types and store them in DB."
		task :service_types , :needs => :environment do
		  DCGOV::Open311.get_service_types().each do |item|
		    ServiceType.create(:service_type => item.service_type, :service_code => item.service_code)
		  end
		end

		desc "Fetch current data feed and store them in the DB for development."
		task :current do
		end
		  
	end
end
