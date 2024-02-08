class UsersController < ApplicationController
  before_action :user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(strong_params)
    if @user.save
      redirect_to user_dashboard_path(@user)
    else
      flash[:alert] = 'Please fill in all fields, email must be unique'
      redirect_to new_user_path
    end
  end

  def show
    @facade = MovieFacade.new(user: user, type: :viewing_parties)
  end

  private

  def user
    User.find(params[:id])
  end

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
