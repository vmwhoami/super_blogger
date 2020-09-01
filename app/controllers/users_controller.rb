
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(private_params)

    if @user.save
      flash[:success] = "Welcome #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(private_params)
      flash[:notice] = 'User was successfully updated'
      redirect_to articles_path
    else
      render :edit
    end
  end

  private

  def private_params
    params.require(:user).permit(:username, :email, :password)
  end
end
