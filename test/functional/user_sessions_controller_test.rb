require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    post :create, :user_session => { :username => (Factory :user).username, :password => "badpassword" }
    assert_template 'new'
    assert_nil UserSession.find
  end
  
  def test_create_valid
    user = Factory :user
    post :create, :user_session => { :username => user.username, :password => user.password }
    assert_redirected_to my_account_path
    assert_equal user, UserSession.find.user
  end
end
