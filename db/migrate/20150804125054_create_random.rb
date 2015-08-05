class CreateRandom < ActiveRecord::Migration
  def change
    create_table :randoms do |t|
    	t.belongs_to :url
    	t.string :name
  

    end
  end
end
