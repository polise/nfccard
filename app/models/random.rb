class Random < ActiveRecord::Base
	belongs_to :url
	set_primary_key "id"
end
