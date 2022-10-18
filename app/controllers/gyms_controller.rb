class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    #/gyms
    def index
        render json: Gym.all, status: :ok
    end

    # - **View one specific gym**
    # - if `Gym` exists, return JSON data for the gym

    #/gyms/id
    def show
        gym = Gym.find(params[:id])
        render json: gym, status: 200
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gyms_param)
        render json:
    end

    #/gyms/id
    def destroy
        Gym.find(params[:id]).destroy
        # gym = Gym.find(params[:id])
        # gym.destroy
        render json: {}, status: 200
        head :no_content
    end

    # - else return error with a status code
    private
    def not_found
        render json: {"error": "Gym not found"}
    end

    # def not_found(error)
    #     render json: { error: error.message}, status: 404
    #     #render json: { error: error.message}, status: :not_found
    # end
end