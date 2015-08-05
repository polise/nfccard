class RemoveNameFromUrls < ActiveRecord::Migration
   def up
  	remove_column :urls, :name
  end
  def down
  	add_column :urls, :name, :string
  end
end
