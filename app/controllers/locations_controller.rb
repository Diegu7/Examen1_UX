class LocationsController < ApplicationController
	before_action :get_loc, only: [:destroy, :show, :edit, :update]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@locations = Location.all.order('Created_at DESC')
	end

	def new
		@location = Location.new
	end

	def edit
	end
	  
	def update
	  	if @location.update(loc_params)
	    	redirect_to @location
	    else
	    	render 'edit'
	   	end
	end

	def destroy
	    @location.destroy
	    redirect_to locations_path
	end

	def show
	end

	def create
	    @location = current_user.locations.new(loc_params)
	    @location.save
	    redirect_to @location
	end

	private
		def get_loc
			@location = Location.find(params[:id])
		end
		def loc_params
      		params.require(:location).permit(:name)
    	end
end
