class CreateSectionEdits < ActiveRecord::Migration[5.0]

  # this is a rich table join between admin_users table and sections table
  def up
    create_table :section_edits do |t|
    	t.references :admin_user
    	t.references :section
    	t.string :summary
      	t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

 def down 
  	drop :section_edits
  end
end