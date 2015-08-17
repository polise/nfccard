class ReformatAgain < ActiveRecord::Migration
  def change

  	drop_table :randoms
  	drop_table :geos
  	drop_table :weathers

  	create_table :random_urls do |t|
  		t.belongs_to :nfc_urls, index: true
  		t.integer :nfc_url_id
  		t.string :url_1
  		t.string :url_2
  		t.string :url_3
  		t.timestamps null:false
  	end

    create_table :geo_urls do |t|
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

    create_table :weather_urls do |t|
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

  	remove_column :nfc_urls, :random_id
  	remove_column :nfc_urls, :geo_id
  	remove_column :nfc_urls, :weather_id

    add_column :nfc_urls, :random_url_id, :integer
    add_column :nfc_urls, :geo_url_id, :integer
    add_column :nfc_urls, :weather_url_id, :integer


  end
end
