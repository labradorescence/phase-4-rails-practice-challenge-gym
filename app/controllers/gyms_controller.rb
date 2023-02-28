class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :error_handling

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        #Gym.find(params[:id]).destroy
        #render json: {}, status: :ok
        head :no_content, status: :no_content
    end

    private

    def error_handling
        #byebug
        render json: {"error": "Gym not found"}, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end

end
