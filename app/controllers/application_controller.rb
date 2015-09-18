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
  		logger.debug("GOT LATLONG FROM COOKIES AND IT IS #{@lat_lng}")
    end
  end


  def set_cookie(counter)
    cookies[:counter] = counter
  end


  def get_cookie()
    if cookies[:counter]
      return cookies[:counter]
    else
      return 1
    end

  end


end
