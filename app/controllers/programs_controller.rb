class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_funder!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @programs = Program.where(release_and_status: 1).order("release_date DESC").limit(5)
    
  end
  
  def new
    @program = Program.new
  end

  def create
    release_and_status = program_params[:release_and_status]
    if release_and_status == 0
      @program = Program.new(program_params.merge(program_state: 0))
    else
      @program = Program.new(program_params.merge(program_state: 1, release_date: Date.today))
    end
    
    if @program.save
      redirect_to program_path(@program)
    else
      @program.valid?
      @program.errors.full_messages
      render :new 
    end
  end

  def show
    funder_id = Program.where(id: params[:id]).pluck(:funder_id)
    @funder = Funder.find_by(id: funder_id)
        
    if @program.release_and_status == 0
      redirect_to root_path
    end

    if user_signed_in?
      new_history = @program.view_histories.new
      new_history.user_id = current_user.id

      if current_user.view_histories.exists?(program_id: params[:id])
        old_history = current_user.view_histories.find_by(program_id: params[:id])
        old_history.destroy
      end
      new_history.save

      histories_stock_limit = 4
      histories = current_user.view_histories.all
      if histories.count > histories_stock_limit
       histories[0].destroy
      end
    end
  end

  def edit
  end

  def update
    if @program.update(program_params)
      if @program.release_and_status == 1 && @program.program_state == 0
        @program.update(program_state: 1, release_date: Date.today)
      elsif @program.release_and_status == 2
        @program.update(program_state: 4, stop_date: Date.today)
      end
        redirect_to funders_mypage_programs_path
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to funders_mypage_programs_path, flash: { danger: "削除が完了しました" }
  end

  def search_result
    @programs = Program.where(release_and_status: 1).order("release_date DESC").search(params[:name], params[:area_ids], params[:target_ids], params[:field_ids]).page(params[:page]).per(5)
    @program_count = Program.where(release_and_status: 1).search(params[:name], params[:area_ids], params[:target_ids], params[:field_ids]).count
    @searches = SearchParameterSafe.where(user_id: current_user.id).order("created_at DESC").limit(3) if user_signed_in?
  end

  def funders_program_index
    funder_id = current_funder.id
    @program_count = Program.where(funder_id: funder_id).count
    @funder_programs = Program.where(funder_id: funder_id).order("created_at DESC").page(params[:page]).per(2)
  end

  private
  def program_params
    params.require(:program).
           permit(:program_name, :start_datetime, :end_datetime, :grant_amount, :overview, :url, :determining_time, :implementation_period, :payment_method, :selection_method, :use, :self_pay, :essential_point, :message, :release_and_status, :program_logo, {area_ids:[] }, { target_ids:[] }, { field_ids:[] }).
           merge(funder_id: current_funder.id)
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
