class PitchesController < ApplicationController
  respond_to :json

  def index
    respond_with Pitch.order(:id)
  end

  def vote
    if current_user.votes.count < 3
      current_user.votes.create(:pitch_id => params[:id])
      render :json => { :status => "success" }
    else
      render :json => { :status => "failure" }
    end
  end

  def show
    @pitch = Pitch.find(params[:id])
  end
end
