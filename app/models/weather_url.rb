class WeatherUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run(lat_lng,counter)
		# look up weather service based on LatLon
	



		if(lat_lng)	
			forecast = ForecastIO.forecast(lat_lng.at(0), lat_lng.at(1))
		elsif 
			logger.debug("COULDN'T GET WEATHER USING GENERIC LDN COORDINATE")
			forecast = ForecastIO.forecast(0.52, -0.0818)
		end
		summary = forecast.currently.summary

		
		if summary.downcase.include? "cloud" or summary.downcase.include? "overcast"
			return [counter.to_i+1,find_url('Overcast')]
		elsif (summary.downcase.include? "sun" or summary.downcase.include? "clear")
			return [counter.to_i+1,find_url('Sunny')]
		elsif (summary.downcase.include? "rain" or summary.downcase.include? "drizzle")
			return [counter.to_i+1,find_url('Raining')]
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