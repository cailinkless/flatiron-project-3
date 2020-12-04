class ProductionsController < ApplicationController

    def index
        @productions = Production.all
    end

    def new
        @production = Production.new
        @companies = Company.all
    end

    def create
        binding.pry
        @production = Production.create(production_params)
        redirect_to production_path(@production)
    end

    def show
    end

    def edit
        @production = Production.find_by(production_params)
        @companies = Company.all
    end

    def update
    end

    def destroy
    end

    private

    def production_params
        params.require(:production).permit(
            :title,
            :opening, 
            :closing,
            company_id: [],
            company_attributes: [
                :name
            ]
        )
    end

end
