class AddPrivateToAlpha < ActiveRecord::Migration
  def change
    add_column :alphas, :private, :boolean, :default => false
  end
end
