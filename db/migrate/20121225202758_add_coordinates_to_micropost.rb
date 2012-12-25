class AddCoordinatesToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :micropost_lat, :decimal, :precision => 11, :scale => 8
    add_column :microposts, :micropost_lng, :decimal, :precision => 11, :scale => 8
  end
end
