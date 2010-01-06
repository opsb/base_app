require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "new action" do
    should "render " do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      User.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'      
    end
    
    should "redirect when model is valid" do
      User.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to my_account_path
    end
  end
  
  logged_in_context do
    context "edit action" do
      should "render edit template" do
        get :edit
        assert_template 'edit'
      end
    end

    context "update action" do
      should "render edit template when model is invalid" do
        User.any_instance.stubs(:valid?).returns(false)
        put :update
        assert_template 'edit'
      end

      should "redirect when model is valid" do
        User.any_instance.stubs(:valid?).returns(true)
        put :update
        assert_redirected_to my_account_path
      end
    end
  end
end
