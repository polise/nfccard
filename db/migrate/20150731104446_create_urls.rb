class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.string :cardid
      t.string :behaviour
      t.string :condition

      t.timestamps null: false
    end
  end
end
