class OmniauthController < ApplicationController
  def callback
    Rails.logger.info "omniauth: #{request.env["omniauth.auth"]}"

    auth_hash = request.env["omniauth.auth"]
    user = User.find_or_create_by_email(auth_hash["info"]["email"])
    
    if user.update_attributes(:name => auth_hash["info"]["name"])
      session[:user_id] = user.id
      redirect_to root_path, :notice => 'You are now logged in.'
    else
      redirect_to root_path, :error => 'Login failed.'
    end
  end
end
