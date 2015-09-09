class GeoUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run(lat_lng)

		lat = lat_lng.at(0).to_f
		long = lat_lng.at(1).to_f

		# coordinates
		shoreditch = [51.526,0.0780]
		cw = [51.5036, 0.0183]
		sk = [51.4942, 0.1747]

		# lms doesn't make us closer to shoreditch
		sdtotal = 0.5*(lat - shoreditch.at(0))**2 + 0.5*(long - shoreditch.at(1))**2
		cwtotal = 0.5*(lat - cw.at(0))**2 + 0.5*(long - cw.at(1))**2
		sktotal = 0.5*(lat - sk.at(0))**2 + 0.5*(long - sk.at(1))**2


		if [sdtotal, cwtotal, sktotal].min == sdtotal
			return find_url('Shoreditch')
		elsif [sdtotal, cwtotal, sktotal].min == sktotal
			return find_url('South Kensington')
		elsif [sdtotal, cwtotal, sktotal].min == cwtotal
			return find_url('Canary Wharf')
		else

		end

			
	end


	def find_url(location)
	 
	      
	  	if location_1 == location
	  		return url_1
	  	elsif location_2 == location
	  		return url_2
	  	elsif location_3 == location
	  		return url_3
	  	else 
	  		raise "Unknown Weather Condition"
	 	end
	end 


end