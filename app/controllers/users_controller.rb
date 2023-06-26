
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "User was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: :see_other
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :birth_date, :gender, :about_me, :profile_picture, :location)
  end

  def calculate_age(birth_date)
    now = Date.today
    age = now.year - birth_date.year
    age -= 1 if now < birth_date + age.years
    age
  end
end
