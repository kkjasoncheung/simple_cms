class Page < ActiveRecord::Base
	# database already has a FOREIGN KEY COLUMN created.
	# child table must always have a FOREIGN KEY CREATED

	# call these AdminUsers 'editors'
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	belongs_to :subject
	has_many :sections

	# callback methods 
	before_validation :add_default_permalink
	# happens for after creating or updating.
	after_save :touch_subject
	after_destroy :delete_related_sections
	# this scope means that you can have page 1 to 3 for one subject, and page 1 to 3 for another subject
	# multiple number 1s will not be a problem because the positions will be checked based on the subject
	acts_as_list :scope => :subject
	
	# ORDER of these are IMPORTANT

	# validates_presence_of :name 
	# validates_length_of :name, :maximum => 255
	validates :name, :presence => true,
						:length => {:maximum => 255}

	# validates_presence_of :permalink
	# validates_length_of :permalink, :within => 3..255
	# use presence_of with length_of to disallow spaces 

	validates :permalink, :presence => true,
						:length => {:maximum => 255}, 
						:uniqueness =>true

	# validates_uniqueness_of :permalink	
	# for unique values by subject use ":scope => :subject_id"

	scope :visible, lambda{where(:visible=>true)}
	
	scope :sorted, lambda{order("pages.position ASC")}

	private

	def add_default_permalink
		if permalink.blank?
			# good practice to use self.attr_name when setting model attributes
			self.permalink = "#{id}-#{self.name.parameterize}"

		end

	end

	def touch_subject
		# touch is similar to:
		# subject.update_attribute(:updated_at, Time.now)
		# updates the timestamp
		# any time the page is updated, mark the subject as updated too
		subject.touch
	end

	def delete_related_sections
		self.sections.each do |section|
			# section.destroy
		end

	end
end


