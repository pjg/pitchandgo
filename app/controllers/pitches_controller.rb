class PitchesController < ApplicationController
  respond_to :json

  def index
    if current_user.has_finished_voting?
      respond_with Pitch.order(:id).as_json(:methods => :votes_count)
    else
      respond_with Pitch.order(:id)
    end
  end

  def vote
    if current_user.votes.count < 3
      current_user.votes.create(:pitch_id => params[:id])
      render :json => { :status => "success",
                        :votes_left => 3-current_user.votes.count }
    else
      render :json => { :status => "failure" }, :status => 400
    end
  end

  def show
    @pitch = Pitch.find(params[:id])
  end
end
