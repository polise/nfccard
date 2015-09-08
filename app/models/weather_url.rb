class WeatherUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run()
		# look up weather service based on LatLong
		
	end
end
