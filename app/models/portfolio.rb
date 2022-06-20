class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image

	def self.ror
		where(title: "Ruby on Rails 1")
	end

	scope :ror_scope ,-> {where(title: "Ruby on Rails 2")}
end
