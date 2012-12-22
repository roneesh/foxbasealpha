class CreateWhitelists < ActiveRecord::Migration
  def change
    create_table :whitelists do |t|
      t.integer :user_id
      t.integer :alpha_id

      t.timestamps
    end
  end

end
