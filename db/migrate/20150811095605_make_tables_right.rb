class MakeTablesRight < ActiveRecord::Migration
  def change
  	drop_table :nfc_url
  	drop_table :random_urls
  	drop_table :geos
  	drop_table :weathers
  	drop_table :nfc_urls
  	drop_table :urls
  	

  	create_table :nfc_urls do |t|
  		t.string :cardid
  		t.string :behaviour
  		t.string :random_id
  		t.string :geo_id
  		t.string :weather_id
  		t.timestamps null:false
  	end


  	create_table :randoms do |t|
  		t.belongs_to :nfc_urls, index: true
  		t.integer :nfc_url_id
  		t.string :url_1
  		t.string :url_2
  		t.string :url_3
  		t.timestamps null:false
  	end

    create_table :geos do |t|
  		t.belongs_to :nfc_urls, index: true
  		t.integer :nfc_url_id
  		t.string :url_1
  		t.string :location_1
  		t.string :url_2
  		t.string :location_2
  		t.string :url_3
  		t.string :location_3
  		t.timestamps null:false
  	end

    create_table :weathers do |t|
  		t.belongs_to :nfc_urls, index: true
  		t.integer :nfc_url_id
  		t.string :url_1
  		t.string :weather_1
  		t.string :url_2
  		t.string :weather_2
  		t.string :url_3
  		t.string :weather_3
  		t.timestamps null:false
  	end



  end
end
