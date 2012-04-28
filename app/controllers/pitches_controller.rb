class PitchesController < ApplicationController
  respond_to :json

  def index
    respond_with Pitch.order(:id)
  end
end
