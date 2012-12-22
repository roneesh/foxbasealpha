class RemovePublicFromAlpha < ActiveRecord::Migration
  
  def change
  
  	remove_column :alphas, :public, :boolean

  end
end
