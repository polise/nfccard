class RandomController < ApplicationController

  def index
    @random = Random.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @random = Random.new
  end

  # GET /urls/choose
  def choose
    @random = Random.new
  end


  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @random = Random.new(random_params)
  end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_random
        @random = Random.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def random_params
        params.require(:url_id).permit(:url_1, :url_2, :url_3)
      end
    end
end
