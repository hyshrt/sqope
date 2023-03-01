class AdminsController < ApplicationController
  before_action :authenticate_admin ,only: [:index]

  def index
  end

  def new
  end

  def create
    # @admin = Admin.find_by(admin_name: params[:admin_name], password_digest: params[:password])
      # if @admin
      #   session[:admin_id] = @admin.id
      #   redirect_to "https://njin-base.com"
      # else
      #   render action: "new"
      # end
    
    admin = Admin.find_by(admin_name: params[:admin_name])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admins_dashboard_path
    else
      render action: "new"
    end
  end

  def destroy
  end

  private
    def authenticate_admin
      if session[:admin_id]
        @admin = Admin.find(session[:admin_id])
      else
        redirect_to admins_login_path
      end
    end
end
