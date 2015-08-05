class Url < ActiveRecord::Base
	
  has_one :geo, :dependent => :destroy
  has_one :random, :dependent => :destroy
  has_one :weather, :dependent => :destroy

  accepts_nested_attributes_for :geo
  accepts_nested_attributes_for :random #, :reject_if => lambda { |a| a[:url_id].blank? }
  accepts_nested_attributes_for :weather

  def find_behaviour
  	if geo
  		return geo
  	elsif random
  		return random
  	elsif weather
  		return weather
  	else
  		return nil
  	end
  end

end
