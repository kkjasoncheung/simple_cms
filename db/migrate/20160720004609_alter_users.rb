class AlterUsers < ActiveRecord::Migration[5.0]
  def up
  	# change name of table 

  	puts "*** Changing the User database Name ***"

  	rename_table('users', 'user_database')

  	#add a column to the database 
 	add_column('user_database', 'age', :string, :limit=>3,:null=>false)

  	# rename column in database
  	rename_column('user_database','password','hash_password')


  end

  def down

  	# rename column in database
  	rename_column('user_database','hash_password','password')

  	# remove column 

  	#add a column to the database 
  	remove_column('user_database', 'age')
	
  	# change name of table 
  	rename_table('user_database', 'users')
  	

  end
end
