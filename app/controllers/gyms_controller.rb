class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    def show
        gym = Gym.find_by!(id: params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find_by!(id: params[:id])
        header :no_content
    end

    private
    def gym_params
    end


    def render_record_not_found
        render json: { error: "Gym not found"}, status: 404
    end
end
