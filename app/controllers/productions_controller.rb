class ProductionsController < ApplicationController

    def index
        @productions = Production.all.published
    end

    def new
        @production = current_user.productions.build(company_id: params[:company_id])
    end

    def create
        @production = current_user.productions.create(production_params)
        redirect_to production_path(@production)
    end

    def show
        @production = Production.find(params[:id])
    end

    def edit
        @production = Production.find(params[:id])
    end

    def update
        @production = Production.find(params[:id])
        if @production.update(production_params)
            redirect_to production_path(@production)
          else
            render :edit
        end
    end

    def destroy
        binding.pry
        Production.find(params[:id]).destroy
        redirect_to root_path
    end

    def publish
        @production = Production.find(params[:id])
        @production.published = !@production.published 
        @production.save
        redirect_to production_path(@production)
        # redirect based on from whence it was pushed?
    end

    private

    def production_params
        params.require(:production).permit(
            :title,
            :opening, 
            :closing,
            :company_id,
            company_attributes: [
                :name
            ]
        )
    end

end
