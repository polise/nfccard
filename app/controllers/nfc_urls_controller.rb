class NfcUrlsController < ApplicationController
  before_action :set_nfc_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @nfc_urls = NfcUrl.all
  end 

  # GET /urls/1
  # GET /urls/1.json
  def show

    @behaviour = @nfc_url.behaviour

    case @behaviour
    when 'weather'
      render :show_weather
    when 'geo'
      render :show_geo
    when 'random'
      render :show_random
    else
      raise "Unknown Behaviour"
    end

  end

  # GET /urls/new
  def new
    @nfc_url = NfcUrl.new(nfc_url_params[:nfc_url]) #had an @ sign was nfc_url_params
    #params = { nfc_url : { random_url: { nfc_url_id: @nfc_url }}}
    
    
    #render :chooseFoo.includes(:bar).where.not('bars.id' => nil)
  
    case @nfc_url.behaviour
      when 'weather'
        @weather_url = WeatherUrl.new
        @nfc_url.weather_url = @weather_url


        render :form_weather
      when 'random'
        @random_url = RandomUrl.new

        @nfc_url.random_url = @random_url

        render :form_rando


      when 'geo'
        @geo_url = GeoUrl.new
        @nfc_url.geo_url = @geo_url

        render :form_geo
      else
        raise "Unknown behaviour"
      end
  end




  # GET /urls/choose
  def chooser
    @nfc_url = NfcUrl.new
  end

  def card_tap
    @nfc_url = NfcUrl.find_by_card_id(params[:cardid])
  end

  def find_by_card_id

  end
  # GET /urls/1/edit
  def edit


    @behaviour = @nfc_url.behaviour

    case @behaviour
    when 'weather'
      render :form_weather
    when 'geo'
      render :form_geo
    when 'random'
      render :form_rando
    else
      raise "Unknown Behaviour"
    end
  end

  # POST /urls
  # POST /urls.json
  def create
    @nfc_url = NfcUrl.new(nfc_url_params[:nfc_url])
    #render :new
    

    if @nfc_url.save
      respond_to do |format|
        format.html {redirect_to @nfc_url, notice: 'Url was successfully cree-ated.' } #changed from nfc_url to shower_nfc_url
      end
    else
      respond_to do |format|     
         format.html { render :new }
         format.json { render json: @nfc_url.errors, status: :unprocessable_entity }
       end
    end
  end



  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    
      if @nfc_url.update(nfc_url_params)
       respond_to do |format|
          format.html {redirect_to @nfc_url, notice: 'Url was successfully updated.' }

          case @nfc_url.behaviour
            when 'weather'
              format.json { render :show_weather, status: :ok, location: @nfc_url }
            
            when 'random'
              format.json { render :show_random, status: :ok, location: @nfc_url }

            when 'geo'
              format.json { render :show_geo, status: :ok, location: @nfc_url }


            else
              raise 'Unknown NFC Card Behaviour. Page cannot load'

          end
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @nfc_url.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @nfc_url.destroy
    respond_to do |format|
      format.html { redirect_to nfc_urls_url, notice: 'That URL was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect
    @nfc_url = NfcUrl.find_by_cardid(params[:cardid])
    # Figure out how to 'run' the redirect
    if @nfc_url 
      runner = @nfc_url.find_behaviour
      if runner
        redirect_to runner.run()
      else
        raise "No behaviour found"
      end
    else
      raise "Unknown cardid"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfc_url
      @nfc_url = NfcUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

      # require(:nfc_url) Worked, but render form_rando won't work unless nfc_url is required. 
    def nfc_url_params
      params.permit(nfc_url: [ :behaviour,
                               geo_url_attributes: [:nfc_url_id, :url_1, :location_1, :url_2, :location_2, :url_3, :location_3 ],
                               random_url_attributes: [:nfc_url_id, :url_1, :url_2, :url_3],
                               weather_url_attributes: [ :nfc_url_id, :url_1, :weather_1, :url_2, :weather_2, :url_3, :weather_3  ]]
                    )
    end
end
