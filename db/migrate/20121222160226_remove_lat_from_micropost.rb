class RemoveLatFromMicropost < ActiveRecord::Migration
  def up
    remove_column :microposts, :lat
  end

  def down
    add_column :microposts, :lat, :decimal
  end
end
