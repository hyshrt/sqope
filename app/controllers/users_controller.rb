class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def mypage
  end

  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to users_mypage_path
  end

  def update_password
    if password_set?
      @user.update_password(user_params)
      flash[:notice] = "パスワードを更新しました"
      redirect_to users_mypage_path
    else
      @user.errors.add(:password, "パスワードに不備があります")
      render "edit_password"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, flash: { danger: "アカウントの削除が完了しました"}
  end

  def edit_password
  end

  def view_history
    user_view_history_program_ids = @user.view_histories.pluck(:program_id)
    @histories = Program.where(id: user_view_history_program_ids)
  end

  def interest
    user_view_history_program_ids = @user.interests.pluck(:program_id)
    @interests = Program.where(id: user_view_history_program_ids)
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :email, :password, :password_confirmation)
    end

    def password_set?
      user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
    end
end
