class RemovePrivateFromAlpha < ActiveRecord::Migration
  def up
    remove_column :alphas, :private
  end

  def down
    add_column :alphas, :private, :boolean
  end
end
