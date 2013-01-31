class AddRadiusToAlpha < ActiveRecord::Migration
  def change
    add_column :alphas, :radius, :integer
  end
end
