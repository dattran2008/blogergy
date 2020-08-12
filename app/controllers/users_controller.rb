class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Your account has been created successfully!'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_param)
      flash[:success] = 'Update successfully!'
      redirect_to edit_user_path(@user)
    end
  end

  def show 
  end

  def edit
    if current_user.admin || current_user == set_user
      set_user
    else
      flash[:danger] = 'You can only edit your own account'
      redirect_to users_path
    end
  end

  def destroy
    flash[:danger] = 'Delete user OK!'
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:username, :email, :password, :name)
  end
end
