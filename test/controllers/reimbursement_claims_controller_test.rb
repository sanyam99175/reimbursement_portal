require "test_helper"

class ReimbursementClaimsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reimbursement_claims_new_url
    assert_response :success
  end

  test "should get create" do
    get reimbursement_claims_create_url
    assert_response :success
  end
end
