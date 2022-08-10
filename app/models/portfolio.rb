class Portfolio < ApplicationRecord
	has_many :technologies
	include Placeholder
	validates_presence_of :title, :body, :main_image

	def self.ror
		where(title: "Ruby on Rails 1")
	end

	scope :ror_scope ,-> {where(title: "Ruby on Rails 2")}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '250',widht: '250')
	end
end
