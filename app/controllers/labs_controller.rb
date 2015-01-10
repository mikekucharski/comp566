class LabsController < ApplicationController

	def new

	end

	def create
		@lab = Lab.new(lab_params)
		@lab.save
		redirect_to @lab
	end

	def show
		# params[:id] coming in from the request
		@lab = Lab.find(params[:id])
	end

	private
		def lab_params
			params.require(:lab).permit(:title, :text)
		end
end
