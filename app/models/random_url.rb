class RandomUrl < ActiveRecord::Base
	belongs_to :nfc_url
	#set_primary_key "id"

	# pick random from list
	def run(lat_lng,counter)

		logger.debug("RANDOMURL COUNTER #{counter}")
		counter = counter.to_i
		case counter
		when 1
			return [2,self.url_1]
		when 2
			return [3,self.url_2]
		when 3
			return [1,self.url_3]
		end

		logger.debug("i got here")
	end
end
