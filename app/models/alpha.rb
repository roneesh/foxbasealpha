class Alpha < ActiveRecord::Base
  attr_accessible :name, :public

  has_many :microposts

  after_create :add_creator_to_whitelist

  before_create :no_duplicate_entries

  def add_creator_to_whitelist
  	
  end

  def no_duplicate_entries

  end

  
end
