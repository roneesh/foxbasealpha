class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :handle


  validates :email, :uniqueness => true, :on => :create
  validates :handle, :uniqueness => true, :on => :create
  validates :email, :uniqueness => true, :on => :update
  has_many :microposts

  has_secure_password

end
