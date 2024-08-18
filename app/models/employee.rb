class Employee < ApplicationRecord
  belongs_to :company
  has_many :reimbursement_claims, dependent: :destroy
  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 12 }
end
