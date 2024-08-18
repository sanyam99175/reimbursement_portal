class Company < ApplicationRecord
    has_many :employees, dependent: :destroy
    validates :name, presence: true
    def employee_count
      employees.count
    end
  
    def total_reimbursement_claims
      employees.joins(:reimbursement_claims).sum(:amount)
    end
end
  