class AddLatToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :lat, :decimal
  end
end
