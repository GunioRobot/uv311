require 'net/http'
require 'csv'
require 'mime/types'

namespace :data do
	namespace :import do

		desc "Fetch service types and store them in DB."
		task :service_types , :needs => :environment do
		  ServiceType.all.each{|x| x.destroy}
		  # that service returns BAD data
      # DCGOV::Open311.get_service_types().each do |item|
      #   ServiceType.create(:service_type => item.service_type, :service_code => item.service_code)
      # end

      list = []
      row_index = 0
		  CSV::Reader.parse(File.open('doc/service_types_controls_apps09.csv', 'rb')) do |row|
		    if row_index > 0 
		      service_type = row[1].to_s
          service_code = row[2].to_s
          list << {:service_type => row[1].to_s, :service_code => row[2].to_s}
        end
        row_index += 1
      end
      
      list.uniq!
      list.each{|x| ServiceType.create(:service_type => x[:service_type], :service_code => x[:service_code])}
      p "Imported #{ServiceType.all.size} ServiceTypes"
		end		  
		
		
		desc "Import service type attributes"
		task :service_types_attributes , :needs => :environment do
		  ServiceTypeAttribute.all.each{|x| x.destroy}
		  row_index = 0
		  CSV::Reader.parse(File.open('doc/service_types_controls_apps09.csv', 'rb')) do |row|
        if row_index > 0  
          if row[5] == 'Y'
             required = true
          else
            required = false
          end
        
          service_code = row[2].to_s
          st = ServiceType.find(:first, :conditions => { :service_code => service_code})
          if !st.nil?  
            ServiceTypeAttribute.create(:id_311 => row[0], :service_code => service_code, :name => row[3].to_s.gsub("NULL",""), :prompt => row[4].to_s.gsub("NULL",""), :required => required, :attribute_type => row[6].to_s.gsub("NULL",""), :width => row[7].to_s.gsub("NULL",""), :item_list => row[8].to_s.gsub("NULL",""), :service_type_id => st.id)
          end 
        end
        row_index += 1
      end
      p "Imported #{ServiceTypeAttribute.all.size} ServiceTypeAttributes"
		end
		
		desc "Import service type attributes"
		task :all , :needs => [:service_types, :service_types_attributes] do
		end
	end
end
