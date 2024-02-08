class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def index
    flash[:error] = 'You must be logged in or registered to access your dashboard'
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = strong_params
    user[:email] = user[:email].downcase
    @user = User.create(user)
    if @user.save && @user.authenticate(user[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}"
      redirect_to user_dashboard_path(@user)
    else
      flash[:error] = "Error: #{error_message(@user.errors)}"
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @facade = MovieFacade.new(user: get_user, type: :viewing_parties)
    else
      flash[:error] = 'You must be logged in or registered to access your dashboard'
      redirect_to root_path
    end
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_dashboard_path(user)
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      redirect_to login_form_path
    end
  end

  def logout_user
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def get_user
    User.find(params[:id])
  end

  def strong_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
