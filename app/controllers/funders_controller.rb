class FundersController < ApplicationController
  before_action :set_funder
  before_action :authenticate_funder!

  def mypage
  end

  def edit
  end

  def update
    @funder.update_without_password(funder_params)
    redirect_to funders_mypage_path
  end

  def update_password
    if password_set?
      @funder.update_password(funder_params)
      flash[:notice] = "パスワードを更新しました"
      redirect_to funders_mypage_path
    else
      @funder.errors.add(:password, "パスワードに不備があります")
      render "edit_password"
    end
  end

  def edit_password
  end

  private
    def set_funder
       @funder = current_funder
    end
    
    def funder_params
      params.permit(:name, :postal_code, :address, :address_building, :tel, :url, :representative, :logo, :email, :password, :password_confirmation)
    end

    def password_set?
      funder_params[:password].present? && funder_params[:password_confirmation].present? ?
      true : false
    end
end
