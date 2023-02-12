class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :view_histories, dependent: :destroy
  has_many :interests, dependent: :destroy
  
  has_many :search_parameter_saves, dependent: :destroy
  
  has_many :programs, through: :view_histories
  has_many :programs, through: :interests

  def update_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end
