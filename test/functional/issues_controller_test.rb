require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, :issue => { :service_request => "something" }
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, :id => issues(:one).to_param
    assert_response :success
  end

  test "should update issue" do
    put :update, :id => issues(:one).to_param, :issue => { }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, :id => issues(:one).to_param
    end

    assert_redirected_to issues_path
  end
end
