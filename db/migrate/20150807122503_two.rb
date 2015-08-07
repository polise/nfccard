class Two < ActiveRecord::Migration


  def change
  	drop_table :randoms
  	
  	create_table :random_urls do |t|
  		t.belongs_to :url, index: true
  		t.integer :url_id
  		t.string :url_1
  		t.string :url_2
  		t.string :url_3
  		t.timestamps null:false
  	end
  end
end
