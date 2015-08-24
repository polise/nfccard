class RandomUrl < ActiveRecord::Base
	belongs_to :nfc_url
	#set_primary_key "id"

	def run()
		# pick random from list
	end
end
