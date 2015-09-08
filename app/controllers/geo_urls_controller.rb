class GeoUrlsController < ApplicationController

  def index
    @geo_url = GeoUrl.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new(someid)
    @geo_url = GeoUrl.new(:geo_url_id => someid)
  end

  # GET /urls/choose
  def choose
    @geo_url = GeoUrl.new
  end

  def initialise(someid)
    @geo_url = GeoUrl.new(:nfc_url_id => someid)
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create(someid)
    @geo_url = new(:nfc_url_id => someid)
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_weather
    @geo_url = GeoUrl.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def geo_url_params
    params.require(:nfc_url_id).permit(:url_1, :url_2, :url_3, :location_1, :location_2, :location_3)
  end

end