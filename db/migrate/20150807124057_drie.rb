class Drie < ActiveRecord::Migration
  def change
	  	create_table :nfc_url do |t|
	  	
	  		t.string "cardid"
	  		t.string "behaviour"
	  		t.string "behaviour_id"
	  		t.timestamps null:false
	  	end

	  	drop_table :random_urls

	  	create_table :random_urls do |t|
	  		t.belongs_to :nfc_url, index: true
	  		t.integer :url_id
	  		t.string :url_1
	  		t.string :url_2
	  		t.string :url_3
	  		t.timestamps null:false
	  	end
  end
end
