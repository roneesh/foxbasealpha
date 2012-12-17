class AddAlphaIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :alpha_id, :integer
  end
end
