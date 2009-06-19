namespace :data do
	namespace :import do

		desc "Fetch service types and store them in DB."
		task :service_types , :needs => :environment do
		  DCGOV::Open311.get_service_types().each do |item|
		    p item.inspect
		    #ServiceType.create(:service_type => item.service_type, :service_code => item.service_code)
		  end
		end		  
	end
end
