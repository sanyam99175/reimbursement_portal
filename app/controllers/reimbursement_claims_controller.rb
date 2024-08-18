class ReimbursementClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_employee
  before_action :set_reimbursement, only: [:edit, :update]

  def index
    @reimbursement_claims = @employee.reimbursement_claims
  end

  def new
    @reimbursement_claim = @employee.reimbursement_claims.build
  end

  def create
    @reimbursement_claim = @employee.reimbursement_claims.build(reimbursement_claim_params)
    if @reimbursement_claim.save
      redirect_to company_employee_path(@company, @employee), notice: 'Reimbursement claim was successfully submitted.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reimbursement_claim.update(reimbursement_claim_params)
      redirect_to company_employee_reimbursement_claims_path(@company, @employee), notice: 'Reimbursement was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_reimbursement
    @reimbursement_claim = @employee.reimbursement_claims.find(params[:id])
  end

  def reimbursement_claim_params
    params.require(:reimbursement_claim).permit(:purpose, :amount, :date_of_expenditure)
  end
end
