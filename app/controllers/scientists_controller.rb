class ScientistsController < ApplicationController

    def index
        scientists = Scientist.all
        render json: scientists, except: [:created_at, :updated_at], status: :ok
    end

    def show
        scientist = Scientist.find(params[:id]) #only use find(params[:id]) (not find_by) because it throws exception
        render json: scientist, serializer: ScientistPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params) #make sure to use update! (not update) because it throws exception
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find_by(id: params[:id]) #use find(params[:id]) if using exception
        if scientist
            scientist.destroy
            head :no_content
        else
            render json: { error: "Scientist not found" }, status: :not_found
        end
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
