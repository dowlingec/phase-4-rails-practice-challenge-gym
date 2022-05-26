class GymsController < ApplicationController
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
end
