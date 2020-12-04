class ProductionsController < ApplicationController

    def index
        @productions = Production.all
    end

    def new
        @production = current_user.productions.build
    end

    def create
        # binding.pry
        @production = current_user.productions.create(production_params)
        redirect_to production_path(@production)
    end

    def show
        # binding.pry
        @production = Production.find_by(params[:id])
    end

    def edit
        # clean up
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
