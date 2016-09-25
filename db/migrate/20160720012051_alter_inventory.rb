class AlterInventory < ActiveRecord::Migration[5.0]
  def up
  	# rename table

  	rename_table('item_inventory','items')

  	# change column names

  	rename_column('items','small_quantity','small')
  	rename_column('items','medium_quantity','medium')
  	rename_column('items','large_quantity','large')

  end

  def down
  	rename_column('items','large','large_quantity')
  	rename_column('items','medium','medium_quantity')
  	rename_column('items','small','small_quantity')

  	rename_table('items','item_inventory')
  end
end
