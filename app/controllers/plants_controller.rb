class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all
        render json: plants, status: :ok
    end

    def show
        plants = Plant.find_by_id(params[:id])
        if plants
            render json: plants, status: :ok
        else
            render json: {error: "resource not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
