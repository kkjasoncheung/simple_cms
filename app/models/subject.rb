class Subject < ActiveRecord::Base

	# relationships

	# Could delete related pages automatically 
	# whenever a subject is deleted: 
	# has_many :pages, :dependent => :destroy
	has_many :pages

	acts_as_list 
	
	# ensures name has a value or won't be saved/updated 
	# simple validation
	# validates_presence_of :name 
	# validates_length_of :name, :maximum=>255
	validates :name, :presence => true,
					:length => {:maximum => 255}
	# validates_presence_of vs. validates_length_of :minimum=>1
	# different error messages: "can't be blank" or "is too short"
	# validates_length_of: allows strings with only spaces!

	# writing scopes. Scopes are are prewritten sql commands
	# that can be executed and chained together like the 
	# preset methods like .where and .first, .offset, .limit, .order

	# SYMBOL SYNTAX

	scope :visible, lambda { where(:visible => true) }

	scope :invisible, lambda { where(:visible => false)}

	# disambiguiate the scope by writing the table name before
	# the column name , i.e. subjects.created_at

	scope :sorted, lambda {order ("subjects.position ASC")}

	scope :sorted_reverse, lambda {order ("subjects.created_at ASC")}

	# STRING SYNTAX

	scope :class_order, lambda {order ("subjects.class_size DESC")}

	# ARRAY SYNTAX 

	scope :search, lambda {|query|
		where (["name LIKE ?" , "%#{query}%"])
	}

	scope :three, lambda {limit(3)}

	# can write as above as a scope, or write these as a 
	# ruby method

	def self.newest
		order('subjects.created_at DESC').first
	end

	def self.oldest 
		order('subjects.created_at ASC').first
	end

	def self.g_ten 
		where('subjects.class_size > 10')
	end

	def self.l_twenty
		where("subjects.class_size < 20")
	end

	def self.content_type (ctype)
		puts "The content type is #{ctype}"
	end
end
