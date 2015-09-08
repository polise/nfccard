class NfcUrl < ActiveRecord::Base

  has_one :geo_url, dependent: :destroy
  has_one :random_url, dependent: :destroy
  has_one :weather_url, dependent: :destroy

  accepts_nested_attributes_for :geo_url
  accepts_nested_attributes_for :random_url #, :reject_if => lambda { |a| a[:url_id].blank? }
  accepts_nested_attributes_for :weather_url

  before_save :generate_nfc_id, :on => :create

  def hello
    puts "Hello"
  end

  def generate_nfc_id
    self.cardid = SecureRandom.hex(5)
  end

  def find_behaviour
    case self.behaviour
      
  	when 'geo'
  		return self.geo_url
  	when 'random'
  		return self.random_url
  	when 'weather'
  		return self.weather_url
  	else
  		return nil
  	end
  end


end
