class CreatePages < ActiveRecord::Migration[5.0]
  def up
    create_table :pages do |t|

      t.integer "subject_id"
      # same as: t.references :subject

   	  t.string "name"
   	  t.integer "permalink"
   	  t.integer "position"
   	  t.boolean "visible", default: false
      t.timestamps
    end

	 add_index("pages", "subject_id")
	 add_index("pages","permalink")
  end

  # all foreign keys should always have an index

  def down
  	drop_table :pages
  	# when table is dropped, the indexes are dropped too
  end
end
