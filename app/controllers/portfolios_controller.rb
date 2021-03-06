class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end


	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,:body))

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
				format.json { render  :new }
			else
				format.html { render :new, status: :unprocessable_entity }
   			end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title,:body))
				format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
	    	else
	    		format.html { render :edit }
	    	end
		end
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])
	end

	def destroy
		#perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    #destroy/delete
    @portfolio_item.destroy
#redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record was successfully destroyed." }
     end
	
	end
end

