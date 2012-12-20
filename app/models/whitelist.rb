class Whitelist < ActiveRecord::Base
  attr_accessible :alpha_id, :user_id

  belongs_to :alpha
  belongs_to :user
end
