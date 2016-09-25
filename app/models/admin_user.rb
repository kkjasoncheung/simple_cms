class AdminUser < ActiveRecord::Base

	has_secure_password 
	
	has_and_belongs_to_many :pages

	has_many :section_edits

	has_many :sections, :through => :section_edits
	# to configure a different table name as a result of a migration:
	# don't have to change model
	# self.table_name = "admin_users"

	# activeRecord will create class attributes for each column
	# in the database
	# ex) attr_accessor :first_name

	# all columns in the table have coressponding methods 
	# let you access them

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 25

	# using the validates :attribute shortcut generates the same validation code

	scope :sorted, lambda {order("last_name ASC, first_name ASC")}


	validates :first_name, :presence => true,
							:length => {:maximum => 25}

	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 50

	validates :last_name, :presence => true, 
							:length => {:maximum => 50}

	# validates_presence_of :username
	# validates_length_of :username, :within => 8..25
	# validates_uniqueness_of :username

	validates :username, :presence => true,
						:length => {:maximum => 25},
						:uniqueness => true

	validates :password, :confirmation=>true
	# run validation only on the create action
	# validate :no_new_users_on_saturday, :on => :create

	# custom validation
	# validate :username_is_allowed 
=begin
	def username_is_allowed 
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "has been restricted from use.")
		end
	end
=end  
	# Errors not related to a specific attribute 
	# can be added to errors[:base]

	def name

		first_name + " " + last_name

	end

	def no_new_users_on_saturday 
		if Time.now.wday == 6
			errors[:base] << "No new users on Saturdays."
		end
	end

	# validates_presence_of :email
	# validates_length_of :email, :maximum => 50
	# validates_uniqueness_of :email
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email
	
	validates :email, :presence => true,
						:length => {:maximum => 50},
						:uniqueness => true,
						:format => {:with => EMAIL_REGEX},
						:confirmation => true


	# In the model: 
	# validates_presence_of :email_confirmation, :if => email_changed?
	# In the view: 
	#
	# f.label(:email_confirmation, "Email Confirmation")	
	# f.password_field(:email_confirmation)
	# adds an email_confirmation virtual column		
	
end
