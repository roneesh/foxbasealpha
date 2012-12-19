class Alpha < ActiveRecord::Base
  attr_accessible :name, :public

  has_many :microposts

  after_create :add_creator_to_whitelist

  def add_creator_to_whitelist
  	
  end
end
