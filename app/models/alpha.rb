class Alpha < ActiveRecord::Base
  attr_accessible :name, :admin_id, :isprivate

  has_many :microposts
  has_many :whitelists
  has_many :users, :through => :whitelists

  after_create :add_creator_to_whitelist

  before_create :no_duplicate_entries

  validates_presence_of :name

  scope :private_alphas, where("isprivate == ?", true)

  def add_creator_to_whitelist
  	Whitelist.create(user_id: self.admin_id, alpha_id: self.id)
  end

  def no_duplicate_entries

  end

  def remove_all_whitelist_entries_at_destroy

  end

  def points
    points = []
    microposts = Micropost.where(alpha_id: self.id)

    microposts.each do |micropost|
      point = []
      point[0] = micropost.micropost_lat
      point[1] = micropost.micropost_lng

      points << point
    end

    return points

  end



end
