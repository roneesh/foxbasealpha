class Alpha < ActiveRecord::Base
  attr_accessible :name, :admin_id, :isprivate, :alpha_lat, :alpha_lng

  has_many :microposts
  has_many :whitelists
  has_many :users, :through => :whitelists

  before_create :no_duplicate_entries
  after_create :add_creator_to_whitelist
  after_destroy :remove_all_microposts_attached_to_alpha_at_destroy
  after_destroy :remove_all_whitelist_entries_at_destroy

  validates_presence_of :name

  scope :private_alphas, where("isprivate == ?", true)

  def add_creator_to_whitelist
  	Whitelist.create(user_id: self.admin_id, alpha_id: self.id)
  end

  def no_duplicate_entries

  end

  def remove_all_whitelist_entries_at_destroy
    Whitelist.where(alpha_id: self.id).destroy_all
  end

  def remove_all_microposts_attached_to_alpha_at_destroy
    Micropost.where(alpha_id: self.id).destroy_all
  end

  def points
    points = []
    microposts = Micropost.where(alpha_id: self.id)

    microposts.each do |micropost|
      point = []
      point[0] = micropost.micropost_lat
      point[1] = micropost.micropost_lng
      point[2] = micropost.content
      point[3] = User.find_by_id(micropost.user_id).name
      point[4] = User.find_by_id(micropost.user_id).handle
      points << point
    end

    return points

  end



end
