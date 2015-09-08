class WeatherUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run()
		# look up weather service based on LatLong
		forecast = ForecastIO.forecast(51.5072, 0.1275)
		summary = forecast.currently.summary

		
		if summary.downcase.include? "cloud"
			return find_url('Overcast')
		elsif (summary.downcase.include? "sun" or summary.downcase.include? "clear")
			return find_url('Sunny')
		elsif (summary.downcase.include? "rain" or summary.downcase.include? "drizzle")
			return find_url('Raining')
		else 
			raise "New Uncharted Weather"
		end


	end

		def find_url(weathercondition)
	 
	      
	  	if weather_1 == weathercondition
	  		return url_1
	  	elsif weather_2 == weathercondition
	  		return url_2
	  	elsif weather_3 == weathercondition
	  		return url_3
	  	else 
	  		raise "Unknown Weather Condition"
	  	end 

	  end
end