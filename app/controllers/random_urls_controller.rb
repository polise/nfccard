class RandomUrlsController < ApplicationController

  def index
    @random_url = RandomUrl.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @random_url = RandomUrl.new
  end

  # GET /urls/choose
  def choose
    @random_url = RandomUrl.new
  end

  def initialise(someid)
    @random_url = RandomUrl.new(:url_id => someid)
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @random_url = new(random_url_params)
  end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_random
        @random_url = RandomUrl.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def random_url_params
        params.require(:url_id).permit(:url_1, :url_2, :url_3)
      end
    end

end
