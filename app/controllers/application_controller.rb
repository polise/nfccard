class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


 # New line added
 #config.autoload_paths += %W(#{config.root}/lib)

  protect_from_forgery with: :exception

  before_filter :check_location_set

  def check_location_set
  	logger.debug("lat_lng cookie is #{cookies[:lat_lng]}")
  	if cookies[:lat_lng]
	  	@lat_lng = cookies[:lat_lng].split("|")
  		logger.debug("at lat_long = #{@lat_lng}")
  	elsif
      @lat_lng = lat_lng_via_geolocation
    end
  end


  def lat_lng_via_geolocation
    @lat_lng ||= session[:lat_lng] ||=  application.js { render :action => "getGeoLocation", :layout => false }
  end
end
