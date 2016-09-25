class CreateInventory < ActiveRecord::Migration[5.0]
  def up
    create_table :Item_Inventory do |t|

	    t.string "item_name", :limit=>50, :null=>false
	    t.integer "item_total_quantity", :null=>false
	    t.integer "small_quantity", :null=>false
	    t.integer "medium_quantity", :null=>false
	    t.integer "large_quantity", :null=>false

	    t.timestamps
    end
  end

  def down
  	drop_table :Item_Inventory
  end
end
