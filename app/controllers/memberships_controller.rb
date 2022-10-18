class MembershipsController < ApplicationController
    def index
        render json: Membership.all, status: :ok
    end

    def create
        membership = Membership.create(membership_params)
        render json: membership, status: :created
    end

    private
    #strong param 
    def membership_params
        params.permit(:charge, :client_id, :gym_id)
    end
end
