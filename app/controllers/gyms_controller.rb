class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    #/gyms/
    def index
        render json: Gym.all, status: :ok
    end

    #/gyms/id
    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end

    #/gyms/id
    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: 200
    end

    private
    def not_found
        render json: {error: "Gym not found"}, status: 404
    end

    # def not_found(error)
    #     redner json: {error: error.message }, status: 404
    # end

    def gym_params
        params.permit(:name, :address)
    end
end
