class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :handle, :site_admin


  validates :email, :uniqueness => true, :on => :create
  validates :handle, :uniqueness => true, :on => :create
  validates :handle, :uniqueness => true, :on => :update
  validates :email, :uniqueness => true, :on => :update
  has_many :microposts
  has_many :whitelists

  has_secure_password

end
