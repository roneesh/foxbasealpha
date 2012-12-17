class Alpha < ActiveRecord::Base
  attr_accessible :name, :public

  has_many :microposts
end
