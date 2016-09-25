
# pure ruby code where you can write methods and long reusable ruby code.

module ApplicationHelper
	
	def status_tag(boolean, options={})
		options[:true_text] ||= ''
		options[:false_text] ||= ''

		if boolean
			# will generate a span tag
			# with some text and then given
			# a class of true or false depending
			# on the boolean
			# content_tag is another HTML helper
			content_tag(:span, options[:true_text], :class => 'status true')
		else
			content_tag(:span, options[:false_text], :class => 'status false')
		end

	end

	def say_something(name)
		"hello, #{name}"
	end

	def multiply_self(num)
		"#{num*num}"
	end

	def pointless
		"hi"
	end	

	# generating the helper to render partial error
	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals=>{:object => object})
	end
	
	def tiny_error_for(object)
		render(:partial=>'application/side_error_message', :locals=>{:object=>object})
	end
end
