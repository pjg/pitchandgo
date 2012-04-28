class User < ActiveRecord::Base
  attr_accessible :name, :uid, :email
  has_many :votes
end
