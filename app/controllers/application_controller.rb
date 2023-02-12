class ApplicationController < ActionController::Base
  before_action :basic_auth

  private 
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["basic_auth_username"] && password == ENV["basic_auth_password"]
    end
  end
end
