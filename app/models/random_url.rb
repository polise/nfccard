class RandomUrl < ActiveRecord::Base
	belongs_to :nfc_url
	#set_primary_key "id"

	# pick random from list
	def run(lat_lng)
		number = rand(1..3)
		case number
		when 1
			return self.url_1
		when 2
			return self.url_2
		when 3
			return self.url_3
		end

		
	end
end
