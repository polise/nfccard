class AddValsToDbs < ActiveRecord::Migration
   def up
  	add_column :urls, :behaviour_id, :integer
  	remove_column :randoms, :name
  	add_column :randoms, :url_1, :string
  	add_column :randoms, :url_2, :string
  	add_column :randoms, :url_3, :string
  end
  def down
  	add_column :urls, :name, :string
  end
end
