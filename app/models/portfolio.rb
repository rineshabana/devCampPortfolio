class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image

	def self.ror
		where(title: "Ruby on Rails 1")
	end

	scope :ror_scope ,-> {where(title: "Ruby on Rails 2")}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"
	end
end
