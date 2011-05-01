require 'test_helper'

class AccountCreationFlowTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "filling the new account form should create the account and lead to its show page, with a flash message " do
    
    get '/accounts/new'
    assert :success
    
    post_params = { "account[first_name]" => 'abhi', 
                    "account[last_name]" => 'yadav', 
                    "account[phone_number]" => "9988776655",
                    "account[address]" => "some address", 
                    "account[email]" => "e@example.com" }                    
    post_via_redirect '/accounts', post_params

    a = assigns(:account)
    assert_equal "/accounts/#{a.id}",  path 
    assert_equal 'Account was successfully created.', flash[:notice]
  end
  
end
