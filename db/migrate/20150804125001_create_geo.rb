class CreateGeo < ActiveRecord::Migration
  def change
    create_table :geos do |t|
    	t.belongs_to :url
    	t.string :name
    	t.string :condition

    end
  end
end
