class User < ActiveRecord::Base
  attr_accessible :name, :uid, :email
end
