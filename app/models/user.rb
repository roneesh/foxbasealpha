class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :handle

  has_many :microposts

  has_secure_password

end
