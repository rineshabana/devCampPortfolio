module TitleConcern
	extend ActiveSupport::Concern

    included do
    	before_action :set_title
    end

    def set_title
        @page_title = "DevCampPortfolio | My portfolio"
        @seo_content = "Shabana Noor"
    end
end	