require "test_helper"

class Admin::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_workouts_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_workouts_destroy_url
    assert_response :success
  end
end
