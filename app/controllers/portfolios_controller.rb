class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
	layout 'portfolio'
	def index
		@portfolio_items = Portfolio.all
	end


	def ror
		@portfolio_items = Portfolio.ror
		render :index
	end

	def new
		@portfolio_item = Portfolio.new
		3.times {@portfolio_item.technologies.build}
	end


	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,
			:body,
			technologies_attributes: [:name])
		)

		respond_to do |format|
			if @portfolio_item.save!
				format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
				format.json { render  :new }
			else
				format.html { render :new, status: :unprocessable_entity }
			end
		end
	end

	def edit

		3.times {@portfolio_item.technologies.build}
	end

	def update


		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title,:body))
				format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
			else
				format.html { render :edit }
			end
		end
	end

	def show

	end

	def destroy
		#perform the lookup

    #destroy/delete
    @portfolio_item.destroy
#redirect
respond_to do |format|
	format.html { redirect_to portfolios_url, notice: "Record was successfully destroyed." }
end

end

def set_portfolio_item
	@portfolio_item = Portfolio.find(params[:id])
end
end

