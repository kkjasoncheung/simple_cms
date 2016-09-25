class Section < ActiveRecord::Base
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
	has_many :sections
	# using the acts_as_list gem
	acts_as_list :scope => :page

	# using callbacks
	#after_save :touch_page

	CONTENT_TYPES = ['text','HTML']

	# validates_presence_of :name
	# validates_length_of :name, :within => 5..255
	# validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of :#{CONTENT_TYPES.join(', ')}"
	# validates_presence_of :content

	validates :name, :presence => true,
					:length => {:within => 5..255}

	validates :content_type, :inclusion => {:in=>CONTENT_TYPES, :message => "must be one of #{CONTENT_TYPES.join(', ')}"}

	validates :content , :presence => true

	scope :sorted, lambda {order("sections.position ASC")}

	scope :visible, lambda{where(:visible=>true)}

	private

end
