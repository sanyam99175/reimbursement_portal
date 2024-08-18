class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:edit, :update, :show]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def set_company
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
