class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_employee, only: [:edit, :update]


  def index
    @employees = @company.employees
  end

  def new
    @employee = @company.employees.build
  end

  def show
    @employee = Employee.find(params[:id])
    @total_reimbursement_amount = @employee.reimbursement_claims.sum(:amount)
  end

  def create
    @employee = @company.employees.build(employee_params)
    if @employee.save
      redirect_to company_employees_path(@company), notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to [@company, @employee], notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  private


  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_employee
    @employee = @company.employees.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name,:age)
  end
end
