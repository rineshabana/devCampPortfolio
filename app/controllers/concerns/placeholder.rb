module Placeholder
	extend ActiveSupport::Concern

	def self.image_generator(height:, width:)
		"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"
	end
end