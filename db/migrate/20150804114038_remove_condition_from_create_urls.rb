class RemoveConditionFromCreateUrls < ActiveRecord::Migration
  def up
  	remove_column :urls, :condition
  end
  def down
  	add_column :urls, :condition, :string
  end
end
