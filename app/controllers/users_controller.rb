class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with Pitch.order(:name)
  end
end
