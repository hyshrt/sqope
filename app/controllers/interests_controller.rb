class InterestsController < ApplicationController
  def create
    @interest = Interest.create(user_id: current_user.id, program_id: params[:program_id])
    redirect_back(fallback_location: program_path(params[:program_id]))
  end

  def destroy
    @interest = Interest.find_by(user_id: current_user.id, program_id: params[:program_id])
    @interest.destroy
    redirect_back(fallback_location: program_path(params[:program_id]))
  end
end
