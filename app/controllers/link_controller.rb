class LinkController < ApplicationController
	belongs_to :url

	 # GET /urls/new
  	def new
    	@link= Link.new
 	end
	
	def index
    	@links = Link.all
  	end

	def create

		@link = Link.new(params[:name])


	end



	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:link).permit(:name)
    end
end