class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.create(company_params)
        redirect_to company_path(@company)
    end

    def show
        @company = Company.find(params[:id])
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
            redirect_to company_path(@company)
          else
            render :edit
        end
    end

    def destroy
        Company.find(params[:id]).destroy
        redirect_to root_path
    end

    def company_params
        params.require(:company).permit(
            :name
        )
    end
    
end
