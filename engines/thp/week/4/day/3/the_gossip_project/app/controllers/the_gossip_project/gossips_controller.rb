require_dependency "the_gossip_project/application_controller"

module TheGossipProject
  class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def create
        @gossip = Gossip.new(gossip_params)

        if @gossip.save
  	  redirect_to @gossip
        else
  	  render 'new'
        end

        #redirect_to gossip_path(@gossip)
    end


    def new
        @gossip = Gossip.new
    end


    def edit
        @gossip = Gossip.find(params[:id])
    end


    def show
        @gossip = Gossip.find(params[:id])
    end


    def update
        @gossip = Gossip.find(params[:id])

        if @gossip.update(gossip_params)
           redirect_to @gossip
        else
           render 'edit'
        end
    end


    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy

        redirect_to gossips_path
    end


    private
      def gossip_params
        params.require(:gossip).permit(:anonymous_author, :content)
      end

  end
end
