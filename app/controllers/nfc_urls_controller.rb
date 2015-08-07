class NfcUrlsController < ApplicationController
  before_action :set_nfc_url, only: [:show, :edit, :update, :destroy]

  #has_many :link

  # GET /urls
  # GET /urls.json
  def index
    @nfc_urls = NfcUrl.all
  end 

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @nfc_url = NfcUrl.new
   

    #render :choose
    behaviour = params[:behaviour]

    case behaviour
      when 'weather'
        render :form_weather
      when 'random'
        #@url2 = Url.create this doesn't cause an error so clearly there is something wrong with Rando.
        @random_url = RandomUrl.initialise(someid: @url.id)
        @nfc_url.random = @random_url

        #@random_url.url_id =  
        NfcUrl.behaviour_id = @random_url.find(params[:id])
        
        render :form_rando
      when 'geo'
        render :form_geo
      else
        raise "Unknown behaviour"
      end
  end



  # GET /urls/choose
  def choose
    @nfc_url = NfcUrl.new
  end


  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @nfc_url = NfcUrl.new(nfc_url_params)
    render :new


    if @nfc_url.save
      respond_to do |format|
        format.html {redirect_to @nfc_url, notice: 'Url was successfully cree-ated.' }
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
          format.json { render :show, status: :ok, location: @nfc_url }
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @nfc_url = NfcUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfc_url_params
      params.require(:nfc_url).permit(:name, :behaviour, :cardid, geo_attributes: [:url_id, :name, :condition], random_attributes: [:url_id, :url_1, :url_2, :url_3], weather_attributes: [ :url_id, :name, :condition ])
    end
end
