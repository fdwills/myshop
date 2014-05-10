class LoginsController < ApplicationController
  def new
    render :layout => 'signin'
  end

  def show
    render :new, :layout => 'signin'
  end

  def create
    user = User.find_by_email login_params[:email]
    if user && user.authenticate(login_params[:pass])
      session[:user_id] = user.id
      redirect_to me_user_path(user)
    else
      flash.now.alert = "Email or password is not correct."
      render :new, :layout => 'signin'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end

  private

  def login_params
    params.require(:login).permit(:email, :pass)
  end
end
