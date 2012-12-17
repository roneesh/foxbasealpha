class AddAnonymousToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :anonymous, :boolean, :default => false
  end
end
