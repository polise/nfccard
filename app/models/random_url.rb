class RandomUrl < ActiveRecord::Base
	belongs_to :nfc_url
	#set_primary_key "id"

	# pick random from list
	def run(lat_lng,counter)


		arr = array
		case counter
		when 1
			ser_cookie(2)
			return self.url_1
		when 2
			set_cookie(3)
			return self.url_2
		when 3
			set_cookie(1)
			return self.url_3
		end

		
	end
end
