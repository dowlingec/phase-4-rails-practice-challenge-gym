class ClientsController < ApplicationController
    def show
        client = Client.find_by!(id: params[:id])
        render json: client
    end

    private
    def client_params
        params.permit(:id)
    end
end
