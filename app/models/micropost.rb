class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :lat

  belongs_to :user
end
