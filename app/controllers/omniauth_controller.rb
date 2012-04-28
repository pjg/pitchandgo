class OmniauthController < ApplicationController
  def callback
    Rails.logger.info "omniauth: #{request.env["omniauth.auth"]}"
    auth_hash = request.env["omniauth.auth"]
    
    user = User.new(:name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"])

    if user.save
      session[:user_id] = user.id
      redirect_to root_path, :notice => 'You are now logged in'
    else
      redirect_to root_path, :error => 'Login failed'
    end


  end
end
