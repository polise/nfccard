class CreateNfcUrls < ActiveRecord::Migration
  def change
    create_table :nfc_urls do |t|

      t.timestamps null: false
    end
  end
end
