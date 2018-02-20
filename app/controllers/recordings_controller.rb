class RecordingsController < ApplicationController
	before_action :authenticate_user!

	def create
	   	@location = Location.find(params[:location_id])
	   	@recording = @location.recordings.create(rec_params)
	   	@recording.user_id = current_user.id if current_user
	   	@recording.save
		redirect_to location_path(@location)

  	end
  
  private
  def rec_params
     params.require(:recording).permit(:temp, :status, :user_id) 
  end
end
