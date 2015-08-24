class WeatherUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run(latlong)
		# look up weather service based on LatLong
		
	end
end
