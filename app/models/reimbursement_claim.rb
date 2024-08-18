class ReimbursementClaim < ApplicationRecord
  belongs_to :employee
  validates :purpose, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date_of_expenditure, presence: true
  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date_of_expenditure.present? && date_of_expenditure > Date.today
      errors.add(:date_of_expenditure, "-> can't be in the future")
    end
  end    
end
