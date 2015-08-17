class NfcUrl < ActiveRecord::Base

  has_one :geo_url, dependent: :destroy
  has_one :random_url, dependent: :destroy
  has_one :weather_url, dependent: :destroy

  accepts_nested_attributes_for :geo_url
  accepts_nested_attributes_for :random_url #, :reject_if => lambda { |a| a[:url_id].blank? }
  accepts_nested_attributes_for :weather_url

  def hello
    puts "Hello"
  end

  # def find_behaviour
  # 	if geo
  # 		#return geo_url
  # 	elsif random
  # 		return random_url
  # 	elsif weather
  # 		#return weather
  # 	else
  # 		return nil
  # 	end
  # end


end
