class SearchParameterSavesController < ApplicationController
  before_action :authenticate_user!

  def index
    @searches = SearchParameterSafe.where(user_id: current_user.id)
  end

  def new
    @search_parameter_saves = SearchParameterSafe.new
  end

  def create
    @search_parameter_saves = SearchParameterSafe.new(safe_params)
    if @search_parameter_saves.save
      redirect_to programs_path
    else  
      @search_parameter_saves.valid?
      @search_parameter_saves.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @searches = SearchParameterSafe.find(params[:id])
    @searches.destroy
    redirect_back(fallback_location: search_parameter_saves_path)
  end

  private
  def safe_params
    params.require(:search_parameter_safe).
           permit(:search_name, :name, :area_id, :target_id, :field_id).
           merge(user_id: current_user.id)
  end
end
