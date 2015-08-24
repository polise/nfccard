class GeoUrl < ActiveRecord::Base
	belongs_to :nfc_url

	def run(latlong)
	end
end