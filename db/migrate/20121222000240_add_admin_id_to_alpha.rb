class AddAdminIdToAlpha < ActiveRecord::Migration
  def change
    add_column :alphas, :admin_id, :integer
  end
end
