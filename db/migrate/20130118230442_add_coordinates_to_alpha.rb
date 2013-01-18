class AddCoordinatesToAlpha < ActiveRecord::Migration
  def change
  	add_column :alphas, :alpha_lat, :decimal, :precision => 11, :scale => 8
    add_column :alphas, :alpha_lng, :decimal, :precision => 11, :scale => 8
  end
end
