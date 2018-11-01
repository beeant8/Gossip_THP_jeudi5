class GossipsController < ApplicationController

	def index
		@gossip = Gossip.all
		
	end
	def new
		@gossip = Gossip.new
		
	end
	def create
		if @current_user
			@gossip = Gossip.create!(anonymous_gossiper: params[:gossip][:anonymous_gossiper],title: params[:gossip][:title], content: params[:gossip][:content], user_id: @current_user.id)
		else
			@gossip = Gossip.new
			render 'new'
			flash[:info] = "Veuillez vous identifier"
		end
	end
	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		if @current_user
			@gossip = Gossip.find(params[:id])
			update_params = params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
			@gossip.update(update_params)
			redirect_to gossips_path
		else
			
			
			flash[:info] = "Veuillez vous identifier"
			redirect_to "/gossips"
		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		if @current_user && @gossip.user_id == @current_user.id
			@gossip.destroy
			redirect_to gossips_path
		else
			flash[:info] = "Ceci n'est pas votre gossip!"
			redirect_to gossips_path

		end
	end
end