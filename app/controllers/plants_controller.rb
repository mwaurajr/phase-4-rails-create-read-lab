class PlantsController < ApplicationController
   wrap_parameters format: []
   
    def index
        render json: Plant.all, status: :ok 
    end


    def show
        plants = Plant.find_by(id:params[:id])
        if plants 

            render json: plants, status: :ok

        else
            render json: {error: "plant not found"}, status: :not_found
    end
end


    def create
        plants = Plant.create(plants_params)
        render json: plants, status: :created
        byebug

    end

    private
    
    def plants_params 
    params.permit(:name, :price, :image)
    end



end
