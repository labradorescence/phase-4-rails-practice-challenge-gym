class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def update 
        client = Client.find(params[:id])
        client.update(client_param)
        render json: client, status: :ok
    end

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    end

    private 

    def client_not_found(error)
       # byebug
        render json: {error: error.message}, status: 404
    end

    def client_param
        params.permit(:name, :age)
    end
end
