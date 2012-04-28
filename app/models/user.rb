class User < ActiveRecord::Base
  attr_accessible :name, :uid, :email
  has_many :votes, :dependent => :destroy 

  def has_voted?
    votes.any?
  end
end
