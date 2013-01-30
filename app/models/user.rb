class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :handle, :site_admin


  validates :email, :uniqueness => true, :on => :create
  validates :handle, :uniqueness => true, :on => :create
  validates :handle, :uniqueness => true, :on => :update
  validates :email, :uniqueness => true, :on => :update
  has_many :microposts
  has_many :whitelists

  after_destroy :remove_all_whitelists_attached_to_user_at_destroy
  after_destroy :remove_all_microposts_attached_to_user_at_destroy

  has_secure_password

  def remove_all_whitelists_attached_to_user_at_destroy
    Whitelist.where(user_id: self.id).destroy_all
  end

  def remove_all_microposts_attached_to_user_at_destroy
  	Micropost.where(user_id: self.id).destroy_all
  end

end
