class UserSessionsController < ApplicationController
  skip_before_filter :login_required
    
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged in successfully."
      redirect_to my_account_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    current_session.destroy if logged_in?
    flash[:notice] = "You have been logged out."
    redirect_to login_url
  end
end

