class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :lat, :alpha_id, :anonymous, :micropost_lat, :micropost_lng

  belongs_to :user
  belongs_to :alpha

  validates_presence_of :content
  validates_presence_of :alpha_id

end
