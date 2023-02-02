class Portfolio < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, 
	                              reject_if: lambda {|x| x['name'].blank?}

	include Placeholder
	validates_presence_of :title, :body, :main_image

	def self.ror
		where(title: "Ruby on Rails 1")
	end

	scope :ror_scope ,-> {where(title: "Ruby on Rails 2")}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '350',width: '350')
	end
end
