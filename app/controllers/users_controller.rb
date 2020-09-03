
class UsersController < ApplicationController
 
before_action :find_user, only: [:edit, :update, :show]
before_action :private_user, only:[:edit, :update]
 def index
  @users = User.paginate(page:params[:page], per_page: 3)
 end
 
  def new
    @user = User.new
  end

  def create

    @user = User.new(private_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  
  end

  def update
  
    if @user.update(private_params)
      flash[:notice] = 'User was successfully updated'
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user_articles = @user.articles.paginate(page:params[:page], per_page: 3)
  end

  def destroy
    @user = find_user
    @user.destroy
  end

  private
def private_user
if @user!= current_user
  flash[:danger] = "you can update only your profile"
  redirect_to root_path
end
end

def find_user
  @user = User.find(params[:id])
end

  def private_params
    params.require(:user).permit(:username, :email, :password)
  end
end
