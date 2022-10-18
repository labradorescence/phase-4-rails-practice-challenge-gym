class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Client.all, status: :ok
    end

    #/clients/id
    def show 
        client = Client.find(params[:id])
        render json: client, status: 200
    end


    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json:client, status: 200
    end

    private 
    def not_found
        render json: {error: "Client not found"}, status: 404
    end

    def client_params
        params.permit(:name, :age)
    end
end
