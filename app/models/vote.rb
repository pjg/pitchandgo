class Vote < ActiveRecord::Base
  attr_accessible :pitch_id, :user_id

  belongs_to :user
  belongs_to :pitch

end
