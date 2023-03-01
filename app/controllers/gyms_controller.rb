class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :private_methods_name


    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def update 
        gym = Gym.find(params[:id])
        gym.update(gym_param)
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

        render json: {}, status: :no_content
        #head :no_content, status: :no_content
    end

    private

    def private_methods_name
        #byebug
        render json: {error: "Gym not found <3"}, status: 404
    end

    def gym_param
        params.permit(:name, :address)
    end

end
