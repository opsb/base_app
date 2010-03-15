class UsersController < ApplicationController
  skip_before_filter :login_required, :except => :edit
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to my_account_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account was successfully changed"
      redirect_to my_account_path
    else
      render :action => 'edit'
    end
  end
  
end
