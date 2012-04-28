class User < ActiveRecord::Base
  attr_accessible :name, :uid, :email
  has_many :votes, :dependent => :destroy

  def has_voted?
    votes.any?
  end

  def has_voted_on_pitch?(pitch)
    (pitch.votes.collect(&:id) & votes.collect(&:id)).any?
  end

end
