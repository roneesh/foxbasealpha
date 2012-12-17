class AddPublicToAlpha < ActiveRecord::Migration
  def change
    add_column :alphas, :public, :boolean, :default => true
  end
end
