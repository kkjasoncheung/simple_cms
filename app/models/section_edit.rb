class SectionEdit < ActiveRecord::Base
	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	
	# doesn't have an 'editor_id' foreign key, instead it is a 'admin_user_id' FK
	
	belongs_to :section
end
