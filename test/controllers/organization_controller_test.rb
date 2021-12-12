require "test_helper"

class OrganizationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organization_index_url
    assert_response :success
  end
end
