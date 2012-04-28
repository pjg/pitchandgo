class SiteController < ApplicationController

  def index
    @pitches = Pitch.order(:id)
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, :notice => 'You have been logged out.'
  end

end
