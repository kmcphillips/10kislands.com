class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user_params[:password].present?
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User and and password were successfully updated.'
      else
        render :edit
      end
    else
      if @user.update_without_password(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    if @user == current_user
      flash[:error] = 'You cannot delete yourself.'
    else
      @user.destroy
      flash[:notice] = 'User was successfully destroyed.'
    end

    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
