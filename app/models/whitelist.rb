class Whitelist < ActiveRecord::Base
  attr_accessible :alpha_id, :user_id

  belongs_to :alpha
  belongs_to :user

  # validates :user_id && :alpha_id, :uniqueness => true, :on => :create
  validates :user_id, :uniqueness => { :scope => :alpha_id,
    :message => "only one whitelist entry per user/alpha combination" }

end
