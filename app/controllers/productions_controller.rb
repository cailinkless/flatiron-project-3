class ProductionsController < ApplicationController

    def index
        @productions = Production.all
    end

    def new
        @production = Production.new
    end

    def create
        @production = Production.create(production_params)
        redirect_to production
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def production_params
        params.require(:production, :title).permit(
            :opening, 
            :closing,
            company_id: []
            company_attributes: [
                :name
            ]
        )
    end

end
