class Alpha < ActiveRecord::Base
  attr_accessible :name, :admin_id, :isprivate

  has_many :microposts
  has_many :whitelists
  has_many :users, :through => :whitelists

  after_create :add_creator_to_whitelist

  before_create :no_duplicate_entries

  validates_presence_of :name
  validates_presence_of :isprivate


  def add_creator_to_whitelist
  	Whitelist.create(user_id: self.admin_id, alpha_id: self.id)
  end

  def no_duplicate_entries

  end

  def remove_all_whitelist_entries_at_destroy

  end



end
