class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :private_method


    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :ok
    end


    def show
        client = Client.find(params[:id])
        #client = Client.find_by(params[:id]) ===> will not show error
        render json: client, status: :ok
    end

    private

    def private_method(error)
        render json: {error: error.message}, status: :not_found
    end

    def client_params
        params.permit(:name, :age)
    end
end
