class Pitch < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  has_many :votes

  def votes_count
    votes.count
  end
end
