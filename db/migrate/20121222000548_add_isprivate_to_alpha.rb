class AddIsprivateToAlpha < ActiveRecord::Migration
  def change
    add_column :alphas, :isprivate, :boolean, :default => false
  end
end
