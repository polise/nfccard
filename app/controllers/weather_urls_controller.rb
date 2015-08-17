class WeatherUrlsController < ApplicationController

  def index
    @weather_url = WeatherUrl.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new(someid)
    @weather_url = WeatherUrl.new(:nfc_url_id => someid)
  end

  # GET /urls/choose
  def choose
    @weather_url = WeatherUrl.new
  end

  def initialise(someid)
    @weather_url = WeatherUrl.new(:nfc_url_id => someid)
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create(someid)
    @weather_url = new(:nfc_url_id => someid)
  end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_weather
        @weather_url = WeatherUrl.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def weather_url_params
        params.require(:nfc_url_id).permit(:url_1, :url_2, :url_3, :weather_1, :weather_2, :weather_3)
      end
    end

end