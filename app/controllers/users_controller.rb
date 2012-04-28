class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.order(:name)
  end
end
