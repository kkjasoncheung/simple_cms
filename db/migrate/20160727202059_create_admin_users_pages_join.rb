class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :admin_users_pages, :id=>false do |t|

      # :id=>false , means we do not need a primary ID in this table (primary key)
      # table naming convention for HABTM relationship: table1_table2 (alphabetical order)
      # must create a table for HABTM relationships (a table that consists of only the FKs)
    	# creating a join table for many to many relationships

    	# the two foreign keys, don't need PRIMARY ID
    	# this join table contains the 2 foreign keys of the 
    	# tables we are trying to relate together
    	
      t.integer "admin_user_id"
      # same as t.references :admin_user (table 1 that is being referenced)
    	t.integer "page_id"
      # same as t.references :page (table 2 that is being referenced)


    end

    # indexing foreign keys

    add_index :admin_users_pages, ["admin_user_id", "page_id"]

  end

  def down
  	drop_table :admin_users_pages
  end

end
