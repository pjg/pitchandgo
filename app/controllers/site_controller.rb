class SiteController < ApplicationController

  def index
    @pitches = Pitch.order(:id)
  end

end
