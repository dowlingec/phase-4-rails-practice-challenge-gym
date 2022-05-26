class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    
    def index
        gyms = Gym.all
        render json: gyms
    end
    
    def update
        gym = Gym.find_by!(id: params[:id])
        gym.update(gym_params)
        render json: gym
    end

    def show
        gym = Gym.find_by!(id: params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find_by!(id: params[:id])
        gym.destroy
        head :no_content, status: 204
    end

    private
    def gym_params
        params.permit(:name, :address)
    end


    def render_record_not_found
        render json: { error: "Gym not found"}, status: 404
    end
end
