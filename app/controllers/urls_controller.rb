class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  #has_many :link

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
    #render :choose
    behaviour = params[:behaviour]

    case behaviour
      when 'weather'
        render :form_weather
      when 'random'
        @random = Random.create
        @url.random = @random

        @random.url_id =  Url.find(params[:id])
        Url.behaviour_id = @random.find(params[:id])
        
        render :form_rando
      when 'geo'
        render :form_geo
      else
        raise "Unknown behaviour"
      end
  end



  # GET /urls/choose
  def choose
    @url = Url.new
  end


  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    render :new


    if @url.save
      respond_to do |format|
        format.html {redirect_to @url, notice: 'Url was successfully cree-ated.' }
      end
    else
      respond_to do |format|     
         format.html { render :new }
         format.json { render json: @url.errors, status: :unprocessable_entity }
       end
    end
  end


  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    
      if @url.update(url_params)
       respond_to do |format|
          format.html {redirect_to @url, notice: 'Url was successfully updated.' }
          format.json { render :show, status: :ok, location: @url }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'That URL was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:name, :behaviour, :cardid, geo_attributes: [:url_id, :name, :condition], random_attributes: [:url_id, :url_1, :url_2, :url_3], weather_attributes: [ :url_id, :name, :condition ])
    end
end
