require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  # These two test the search functionality. Written manually - not via scaffold  
  test "search should give accounts with matching first or last name" do
    searchstring = @account.first_name
    get :search, :q => searchstring
    assert_equal [@account], assigns(:accounts)
  end
  
  test "search should render the index view template" do
    get :search, :q => "abhishek"
    assert_template :index
  end

  ## Tests hereafter are generated via the rails scaffold
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, :account => @account.attributes
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, :id => @account.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @account.to_param
    assert_response :success
  end

  test "should update account" do
    put :update, :id => @account.to_param, :account => @account.attributes
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, :id => @account.to_param
    end

    assert_redirected_to accounts_path
  end
  
end
