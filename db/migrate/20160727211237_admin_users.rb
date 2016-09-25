class AdminUsers < ActiveRecord::Migration[5.0]
  def up 
  	create_table :admin_users do |t|
  		t.string "first_name"
  		t.string "last_name"
  		t.string "username"
      t.string "email"
      t.string "hashed_password"
      t.timestamps

      # ANOTHER WAY of adding foreign keys 
      # t.references :user, :index=>true
      # add_foreign_key :admin_users, :users

  	end
  end

  def down
  	drop_table :admin_users
  end
end
