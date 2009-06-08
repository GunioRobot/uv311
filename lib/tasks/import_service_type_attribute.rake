require 'net/http'
require 'csv'
require 'mime/types'

namespace :data do
	namespace :import do

		desc "Import service type attributes"
		task :service_types_attributes , :needs => :environment do
		  row_index = 0
		  CSV::Reader.parse(File.open('doc/service_types_controls_apps09.csv', 'rb')) do |row|
        if row_index > 0  
          if row[5] == 'Y'
             required = true
          else
            required = false
          end
        
        
          st = ServiceType.find(:first, :conditions => { :service_code => row[2].to_s})
          if !st.nil?  
            ServiceTypeAttribute.create(:id_311 => row[0], :name => row[3], :prompt => row[4], :required => required, :attribute_type => row[6], :width => row[7], :item_list => row[8], :service_type_id => st.id)
          end 
        end
        row_index += 1
      end
		end
	end
end